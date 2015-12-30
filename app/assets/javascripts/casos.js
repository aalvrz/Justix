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
