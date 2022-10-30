$('#signinForm').validate({
    rules: {
        username: "required",
        password: "required"
    },
    messages: {
        username: {
            required: "Please enter user name"
        }
    }
});