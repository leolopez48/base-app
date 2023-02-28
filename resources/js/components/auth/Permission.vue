<template>
  <v-container data-app class="p-0">
    <v-col class="pt-0">
      <loader v-if="loading" />
      <v-row class="my-0" v-else>
        <v-col cols="12" sm="6" md="4" class="pr-0" v-for="(permission, index) in permissions" :key="index">
          <v-checkbox v-model="permission.checked" :label="permission.name" @click="selectPermission(permission)" />
        </v-col>
      </v-row>
    </v-col>
  </v-container>
</template>

<script>
import permissionApi from "../../apis/permissionApi";

export default {
  data: () => ({
    permissions: [],
    permissionsSelected: [],
    loading: false,
  }),

  props: {
    permissionProps: {
      type: Array,
      default: () => [],
    },
    editedIndex: {
      type: Number,
      default: -1,
    },
  },

  watch: {
    permissionsSelected: {
      handler: function (val) {
        this.$emit("update-permissions", val);
      },
      deep: true,
    },
  },

  mounted() {
    this.initialize();
    // this.verifyPermissions();
  },

  updated() {
    this.permissionsSelected = this.permissionProps;
  },

  methods: {
    async initialize() {
      this.loading = true;
      const { data } = await permissionApi.get();

      this.permissions = data.permissions;

      this.permissions.forEach((permission) => {
        permission.checked = false;
      });

      this.verifyPermissions();

      this.loading = false;
    },

    selectPermission(permission) {
      if (permission.checked) {
        this.permissionsSelected.push(permission);
        return;
      }

      this.permissionsSelected.splice(permission, 1)
    },

    verifyPermissions() {
      this.permissions.forEach((permission) => {
        this.permissionProps.forEach((permissionProp) => {
          if (permission.name == permissionProp.name) {
            permission.checked = true;
          }
        });
      });
    },
  },
};
</script>

<style></style>
