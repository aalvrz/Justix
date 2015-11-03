$("#caso_cliente_tokens").tokenInput("../clientes.json", {
    propertyToSearch: 'nombre_completo',
    crossDomain: false,
    prePopulate: $("#caso_cliente_tokens").data("pre"),
    theme: "bootstrap",
    hintText: "Introduzca el nombre del cliente...",
    noResultsText: "No hay resultados",
    searchingText: "Buscando..."
});

$("#caso_contraparte_tokens").tokenInput("../contrapartes.json", {
    propertyToSearch: 'nombre_completo',
    crossDomain: false,
    prePopulate: $("#caso_contraparte_tokens").data("pre"),
    theme: "bootstrap",
    hintText: "Introduzca el nombre de la contraparte...",
    noResultsText: "No hay resultados",
    searchingText: "Buscando..."
});

$("#caso_testigo_tokens").tokenInput("../testigos.json", {
    propertyToSearch: 'nombre_completo',
    crossDomain: false,
    prePopulate: $("#caso_testigo_tokens").data("pre"),
    theme: "bootstrap",
    hintText: "Introduzca el nombre del testigo...",
    noResultsText: "No hay resultados",
    searchingText: "Buscando..."
});
