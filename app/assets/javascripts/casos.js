$(function () {

    $('[data-toggle="tooltip"]').tooltip()

    
    $("#caso_cliente_tokens").tokenInput($("#caso_cliente_tokens").data("token-source"), {
        propertyToSearch: 'nombre_completo',
        crossDomain: false,
        preventDuplicates: true,
        prePopulate: $("#caso_cliente_tokens").data("pre"),
        theme: "bootstrap",
        hintText: "Introduzca el nombre del cliente...",
        noResultsText: "No hay resultados",
        searchingText: "Buscando..."
    });
    
    $("#caso_contraparte_tokens").tokenInput($("#caso_contraparte_tokens").data("token-source"), {
        propertyToSearch: 'nombre_completo',
        crossDomain: false,
        preventDuplicates: true,
        prePopulate: $("#caso_contraparte_tokens").data("pre"),
        theme: "bootstrap",
        hintText: "Introduzca el nombre de la contraparte...",
        noResultsText: "No hay resultados",
        searchingText: "Buscando..."
    });
    
    $("#caso_testigo_tokens").tokenInput($("#caso_testigo_tokens").data("token-source"), {
        propertyToSearch: 'nombre_completo',
        crossDomain: false,
        preventDuplicates: true,
        prePopulate: $("#caso_testigo_tokens").data("pre"),
        theme: "bootstrap",
        hintText: "Introduzca el nombre del testigo...",
        noResultsText: "No hay resultados",
        searchingText: "Buscando..."
    });
    
    $('#new_persona_modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var type = button.data('ptype'); // Extract info from data-* attributes
        // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
        // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
        var modal = $(this);
        modal.find('#persona_type').val(type); // Change the select box value
    });
    
});
