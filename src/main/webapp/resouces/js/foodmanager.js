$('#myTable').DataTable();
$('#myTable').on("click", ".icon-delete", function (e) {
    var id = $(this).attr('id');
    console.log(id);
    Swal.fire({
        title: 'Do you want to save the changes?',
        showDenyButton: true,
        showCancelButton: true,
        confirmButtonText: 'Yes',
        denyButtonText: 'No',
        customClass: {
            actions: 'my-actions',
            cancelButton: 'order-1 right-gap',
            confirmButton: 'order-2',
            denyButton: 'order-3'
        }
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire('Saved!', '', 'success');
            setTimeout(() => {
                window.location.href = "/food/delete/" + id;
            }, 1000);
        } else if (result.isDenied) {
            Swal.fire('Changes are not saved', '', 'info');
        }
    });
});

$('#myTable').on("change", "#selectStatus", function (e) {
    location.href = $(this).val();
});