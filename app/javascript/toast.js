function successToast(description) {
    iziToast.success({
        title: 'Sucesso!',
        message: description,
        position: 'topRight'
    });
}

function errorToast(description) {
    iziToast.error({
        title: 'Erro!',
        message: description,
    });
}