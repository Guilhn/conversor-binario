var a = "admin";

$(document).ready(function() {
  $('#logar').on('click', function() {
    if (a == $('#username').val()) {
      window.location.href = "pages/admin/conversor.html";
    } else {
      window.location.href = "pages/user/conversor.html";
    }
  });

});
