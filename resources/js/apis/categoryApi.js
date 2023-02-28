import axios from "axios";
// import { interceptorRequest, interceptorReponse } from "./interceptor";

const categoryApi = axios.create({
    baseURL: "/api/web/category",
});

// categoryApi.interceptors.request.use(interceptorRequest);
// categoryApi.interceptors.response.reject(interceptorReponse);

export default categoryApi;
