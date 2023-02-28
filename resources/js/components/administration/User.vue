<template>
  <div data-app>
    <v-card class="p-3">
      <v-container>
        <h2>Usuarios</h2>
        <div class="options-table">
          <v-btn rounded @click="newUser()" title="Agregar">
            <v-icon> mdi-plus </v-icon> Agregar
          </v-btn>

          <div v-if="selected.length > 0">
            <v-icon @click="updateState()" title="Bloquear usuarios">
              mdi-block-helper
            </v-icon>
            <v-icon @click="updateState('Activate')" title="Reactivar usuarios">
              mdi-account-reactivate
            </v-icon>
          </div>
          <v-spacer></v-spacer>
        </div>
        <v-col cols="12" sm="12" md="12" lg="3" xl="3" class="pl-0 pb-0 pr-0">
          <v-text-field class="mt-3" dense label="Buscar" type="text" v-model="search"
            @input="searchValue()"></v-text-field>
        </v-col>
      </v-container>
      <v-data-table v-model="selected" :single-select="false" show-select :headers="headers" :items="recordsFiltered"
        :options.sync="options" :server-items-length="total" :items-per-page="take" :loading="loading" item-key="id"
        sort-by="id" :footer-props="{ 'items-per-page-options': [15, 30, 50, 100] }">
        <template v-slot:[`item.actions`]="{ item }">
          <v-icon small class="mr-2" @click="editItem(item)">
            mdi-pencil
          </v-icon>
        </template>
        <template v-slot:no-data>
          <v-icon small class="mr-2" @click="initialize"> mdi-refresh </v-icon>
        </template>
      </v-data-table>
    </v-card>

    <v-dialog v-model="dialog" max-width="90%" persistent>
      <v-card class="flexcard" height="100%">
        <v-card-title>
          <h1 class="mx-auto pt-3 mb-3 text-center black-secondary">
            {{ formTitle }}
          </h1>
        </v-card-title>

        <v-card-text>
          <v-container>
            <!-- Form -->
            <v-row class="pt-3">
              <!-- User Name -->
              <v-col cols="12" sm="6" md="6">
                <base-input label="Nombre" v-model="$v.editedItem.name.$model" :validation.sync="$v.editedItem.name"
                  validationTextType="default" :validationsInput="{
                    required: true,
                    minLength: true,
                    maxLength: true,
                  }" />
              </v-col>
              <v-col cols="12" sm="6" md="6">
                <base-input label="Apellidos" v-model="$v.editedItem.surname.$model"
                  :validation.sync="$v.editedItem.surname" validationTextType="default" :validationsInput="{
                    required: true,
                    minLength: true,
                    maxLength: true,
                  }" />
              </v-col>

              <!-- Rol  -->
              <v-col cols="12" sm="6" md="6">
                <base-select label="Rol" v-model.trim="$v.editedItem.rol.$model" :items="roles"
                  :validation="$v.editedItem.rol" />
              </v-col>
              <!-- Rol  -->
              <!-- E-mail -->
              <v-col cols="12" sm="6" md="6">
                <base-input label="Correo electrónico" v-model="$v.editedItem.email.$model"
                  :validation.sync="$v.editedItem.email" validationTextType="none" :readonly="disableEmail"
                  :validationsInput="{
                    required: true,
                    email: true,
                  }" />
              </v-col>
              <!-- E-mail -->
              <!-- Password -->
              <v-col cols="12" sm="6" md="6">
                <base-input label="Contraseña" v-model="$v.editedItem.password.$model"
                  :validation.sync="$v.editedItem.password" validationTextType="none" :type="typePassword" :min="1"
                  autocomplete="off" :validationsInput="{
                    required: true,
                    minLength: true,
                    maxnLength: true,
                    isValidPassword: true,
                    showPassword: true,
                  }" @update-password="showPassword($event)" />
              </v-col>
              <!-- Password -->
            </v-row>
            <!-- Form -->
            <v-row>
              <v-col align="center">
                <v-btn color="btn-normal no-uppercase mt-3" rounded @click="save">
                  Guardar
                </v-btn>
                <v-btn color="btn-normal-close no-uppercase mt-3" rounded @click="close">
                  Cancelar
                </v-btn>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import roleApi from "../../apis/roleApi";
import userApi from "../../apis/userApi";
import { updateAlert, verifySessionFinished } from "../../libs/function";

import {
  required,
  minLength,
  maxLength,
  email,
  helpers,
} from "vuelidate/lib/validators";

export default {
  data() {
    return {
      search: "",
      dialog: false,
      headers: [
        { text: "USUARIO", value: "name" },
        { text: "ROL", value: "rol" },
        { text: "CORREO ELECTRÓNICO", value: "email" },
        // { text: "ESTADO", value: "state" },
        { text: "ACCIONES", value: "actions", sortable: false },
      ],
      records: [],
      recordsFiltered: [],
      editedIndex: -1,
      skip: 0,
      take: 50,
      title: "Usuarios",
      numberItemsToAdd: 50,
      total: 50,
      getDataFromApiItems: false,
      options: {},
      actualPage: 1,
      editedItem: {
        name: "",
        surname: "",
        email: "",
        password: "",
      },
      defaultItem: {
        name: "",
        email: "",
        surname: "",
        password: "",
      },
      textAlert: "",
      alertEvent: "success",
      roles: [],
      redirectSessionFinished: false,
      typePassword: "password",
      selected: [],
      debounceSearch: 0,
      selectedTab: 0,
      disableEmail: false,
    };
  },

  watch: {
    options: {
      handler() {
        this.getDataFromApi();
      },
      deep: true,
    },
  },

  // Validations
  validations: {
    editedItem: {
      password: {
        required,
        minLength: minLength(8),
        maxLength: maxLength(13),
        isValidPassword: helpers.regex(
          "isValidPassword",
          /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,13}$/
        ),
      },
      email: {
        required,
        email,
      },
      name: {
        required,
        minLength: minLength(1),
        maxLength: maxLength(500),
      },
      surname: {
        required,
        minLength: minLength(1),
        maxLength: maxLength(500),
      },
      rol: {
        required,
      },
    },
  },

  // Validations
  computed: {
    formTitle() {
      return this.editedIndex === -1 ? "Nuevo registro" : "Editar registro";
    },
  },

  watch: {
    options: {
      handler() {
        this.getDataFromApi();
      },
      deep: false,
      dirty: false,
    },
    dialog(val) {
      val || this.close();
    },
    dialogBlock(val) {
      val || this.closeBlock();
    },
  },

  created() {
    this.initialize(false);
  },

  methods: {
    async initialize(getDataFromApi = true) {
      this.loading = true;
      this.$v.$reset();
      this.records = [];
      this.recordsFiltered = [];

      let requests = [roleApi.get()];
      if (getDataFromApi) {
        requests.push(this.getDataFromApi());
      }

      const responses = await Promise.all(requests).catch((error) => {
        this.updateAlert({
          response: "error",
          message: "Error al realizar la acción",
        }, this);
        this.redirectSessionFinished = verifySessionFinished(
          error.response.status,
          419
        );
      });
      console.log(responses);
      this.roles = responses[0].data.roles;
      this.loading = false;
    },

    editItem(item) {
      this.editedIndex = this.recordsFiltered.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialog = true;
      this.disableEmail = true;
    },

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    closeBlock() {
      this.dialogBlock = false;

      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },

    async save() {
      this.$v.$touch();
      if (this.$v.$invalid) {
        this.updateAlert({
          status: "warning",
          message: "Por favor, verifique los campos marcados en rojo.",
        }, this);
        return;
      }

      if (this.editedIndex > -1) {
        const edited = Object.assign(
          this.recordsFiltered[this.editedIndex],
          this.editedItem
        );

        const { data, status } = await userApi
          .put(`/${edited.id}`, edited)
          .catch((error) => {
            this.updateAlert({
              response: "error",
              message: "Error al realizar la acción",
            }, this);

            this.redirectSessionFinished = verifySessionFinished(
              error.response.status,
              419
            );
          });

        console.log(data);

        if (data.success) {
          this.redirectSessionFinished = verifySessionFinished(status, 200);
          this.updateAlert(data, this);
        }
      } else {
        //Creating user
        const { data, status } = await userApi
          .post(null, this.editedItem)
          .catch((error) => {
            this.updateAlert({
              response: "error",
              message: "Error al realizar la acción",
            }, this);
            this.close();
            this.redirectSessionFinished = verifySessionFinished(
              error.response.status,
              419
            );
          });

        if (data.success) {
          this.redirectSessionFinished = verifySessionFinished(status, 200);
          this.updateAlert(data, this);
        }
      }

      this.close();
      this.initialize();
      return;
    },

    async getDataFromApi() {
      this.loading = true;
      if (this.actualPage == 1) {
        this.actualPage = 1;
        this.skip = 0;
        this.take = this.numberItemsToAdd;
      }
      const { data } = await userApi
        .get(null, {
          params: this.options,
        })
        .catch((error) => {
          this.redirectSessionFinished = verifySessionFinished(res.status, 200);
        });

      // Showing permission error
      if (!data.success) {
        this.updateAlert(data, this);
        return;
      }

      this.records = data.users;
      this.recordsFiltered = data.users;

      this.total = data.total;

      this.search = "";
      this.loading = false;
    },

    updatePagination(pagination) {
      if (pagination.page != 1) {
        if (pagination.page <= this.actualPage) {
          this.skip -= this.take;
          this.take -= this.numberItemsToAdd;
        } else {
          this.skip = this.take;
          this.take += this.numberItemsToAdd;
        }
      } else {
        this.skip = 0;
        this.take = this.numberItemsToAdd;
      }
      this.actualPage = pagination.page;
    },

    newUser() {
      this.dialog = true;

      this.editedItem.rol = this.roles[0].name;
      this.disableEmail = false;
    },

    async updateState(state = "Block") {
      this.dialogBlock = true;
      this.loading = true;
      this.records = [];
      this.recordsFiltered = [];

      const res = await userApi
        .post("/block", {
          search: this.search,
          skip: this.skip,
          take: this.take,
          users: this.selected,
          state: state,
        })
        .catch((error) => {
          this.updateAlert({
            response: "error",
            message: "Error al realizar la acción",
          }, this);
          this.redirectSessionFinished = verifySessionFinished(
            error.response.status,
            419
          );
        });

      this.getDataFromApi();
      this.selected = [];

      this.loading = false;
    },

    updateTimeOut(event) {
      this.redirectSessionFinished = event;
    },

    showPassword(e) {
      this.typePassword = e.show;
    },

    updateAlert,
    verifySessionFinished,
  },
};
</script>
