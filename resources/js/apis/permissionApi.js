import axios from "axios";

const permissionApi = axios.create({
    baseURL: "/api/web/permission",
});

export default permissionApi;
