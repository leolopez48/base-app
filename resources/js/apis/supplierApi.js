import axios from "axios";
// import { interceptorRequest, interceptorReponse } from "./interceptor";

const supplierApi = axios.create({
    baseURL: "/api/web/supplier",
});

// supplierApi.interceptors.request.use(interceptorRequest);
// supplierApi.interceptors.response.reject(interceptorReponse);

export default supplierApi;
