function toggleDeleteList() {
    $('#listDelete').modal('show');
}

function toggleDeleteTag() {
    $('#tagDelete').modal('show');
}

function toggleModalList() {
    $('#listCreation').modal('show');
}

function toggleUserConfigs() {
    $('#userConfigs').modal('show');
}

function toggleModalTag() {
    $('#tagCreation').modal('show');
}

function toggleSidebar() {
    $('#menuLateral').sidebar('toggle');
}

$(document).ready(function () {
    $('.ui.dropdown').dropdown();
});

