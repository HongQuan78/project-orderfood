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
        empID: {
            required: "Please enter ID"
        },
        empName: {
            required: "Please enter name"
        },
        empUsername: {
            required: "Please enter username"
        },
        empPass: {
            required: "Please enter user name"
        },
        birthdayDate: {
            required: "Please select a birthday"
        },
        address: {
            required: "Please enter address"
        }
        
    }
});