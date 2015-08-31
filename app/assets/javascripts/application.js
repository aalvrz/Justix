// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.tokeninput
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

/* Token Input Scripts */
$(function() {
    $("#caso_client_tokens").tokenInput("../clientes.json", {
        crossDomain: false,
        propertyToSearch: 'nombre_completo',
        prePopulate: $("#caso_client_tokens").data("pre"),
        theme: "bootstrap"
    });
});

$(function() {
    $("#caso_counterpart_tokens").tokenInput("../contrapartes.json", {
        crossDomain: false,
        propertyToSearch: 'nombre_completo',
        prePopulate: $("#caso_counterpart_tokens").data("pre"),
        theme: "bootstrap"
    });
});

$(function() {
    $("#caso_witness_tokens").tokenInput("../testigos.json", {
        crossDomain: false,
        propertyToSearch: 'nombre_completo',
        prePopulate: $("#caso_witness_tokens").data("pre"),
        theme: "bootstrap"
    });
});