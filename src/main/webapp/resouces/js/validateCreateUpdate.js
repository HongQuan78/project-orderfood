$('#empForm').validate({
    rules: {
        empID: "required",
        empName: "required",
        empUsername: "required",
        empPass: "required",
        birthdayDate: "required",
        address: "required",
        empPhone: {
            required: true,
            checkPhone: true
        }
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
            required: "Please enter password"
        },
        birthdayDate: {
            required: "Please select a birthday"
        },
        address: {
            required: "Please enter address"
        }, empPhone: {
            required: "Please enter phone number"
        }

    }

});

jQuery.validator.addMethod("checkPhone", function (value, element) {
    // allow any non-whitespace characters as the host part
    return this.optional(element) || /^((\(0[1-9]\d{0,2}\)|0[1-9]\d{0,2}[\.\-]?)\d{7,8}|0[1-9]\d{8,9})$/.test(value);
}, 'Please enter a valid phone number.');