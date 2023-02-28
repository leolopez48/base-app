import axios from "axios";
// import { interceptorRequest, interceptorReponse } from "./interceptor";

const productApi = axios.create({
    baseURL: "/api/web/product",
});

// productApi.interceptors.request.use(interceptorRequest);
// productApi.interceptors.response.reject(interceptorReponse);

export default productApi;
