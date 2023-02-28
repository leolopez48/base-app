import axios from "axios";
// import { interceptorRequest, interceptorReponse } from "./interceptor";

const brandApi = axios.create({
    baseURL: "/api/web/brand",
});

// brandApi.interceptors.request.use(interceptorRequest);
// brandApi.interceptors.response.reject(interceptorReponse);

export default brandApi;
