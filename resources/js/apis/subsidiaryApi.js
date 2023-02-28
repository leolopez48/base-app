import axios from "axios";

const subsidiaryApi = axios.create({
    baseURL: "/api/web/subsidiary",
});

// subsidiaryApi.interceptors.request.use(interceptorRequest);
// subsidiaryApi.interceptors.response.reject(interceptorReponse);

export default subsidiaryApi;
