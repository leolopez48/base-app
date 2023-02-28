export const verifySessionFinished = (status, code = 200) => {
    if (status == 419 || status == 401) {
        console.log("L" + status);
        return true;
    }
    return false;
};

export const updateAlert = (data = {}, these) => {
    switch (data.response) {
        case "success":
            these.$toastr.s(data.message);
            break;
        case "error":
            these.$toastr.e(data.message);
            break;
        case "warning":
            these.$toastr.w(data.message);
            break;
    }
};
