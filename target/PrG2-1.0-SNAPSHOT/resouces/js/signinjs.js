$('#signinForm').validate({
    rules: {
        username: "required",
        password: "required"
    },
    messages: {
        username: {
            required: "Please enter your user name"
        },
        password: {
            required: "Please enter your password"
        }
    }
});