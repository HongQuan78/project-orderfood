$('#empForm').validate({
    rules: {
        empID: "required",
        empName: "required",
        empUsername: "required",
        empPass: "required",
        birthdayDate: "required",
        address: "required"
    },
    messages: {
        username: {
            required: "Please enter user name"
        }
    }
});