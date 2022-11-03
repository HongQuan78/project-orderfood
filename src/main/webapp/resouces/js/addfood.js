$("#addnew").validate({
    rules: {
        f_id: "required",
        f_name: "required",
        f_price: "required",
        f_s: "required",
        f_img: "required"
    }, messages: {
        f_id: {
            required: "Please enter food ID"
        },
        f_name: {
            required: "Please enter food name"
        },
        f_price: {
            required: "Please enter food price"
        },
        f_s: {
            required: "Please select food status"
        },
        f_img: {
            required: "Please enter a img URL"
        }
    }
});