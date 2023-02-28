import axios from "axios";
// import { interceptorRequest, interceptorReponse } from "./interceptor";

const presentationApi = axios.create({
    baseURL: "/api/web/presentation",
});

// presentationApi.interceptors.request.use(interceptorRequest);
// presentationApi.interceptors.response.reject(interceptorReponse);

export default presentationApi;
