import axios from "axios";
// import { interceptorRequest, interceptorReponse } from "./interceptor";

const customerApi = axios.create({
    baseURL: "/api/web/customer",
});

// customerApi.interceptors.request.use(interceptorRequest);
// customerApi.interceptors.response.reject(interceptorReponse);

export default customerApi;
