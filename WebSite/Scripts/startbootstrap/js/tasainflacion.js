function inicializacion(x, y) {
    // Chart.js scripts
   

    //convertimos el array en json
    var result_ids_indice = JSON.parse(JSON.stringify(x));
    var result_descrip_indice_base = JSON.parse(JSON.stringify(y));

    $("#select_indice_base").html('<option>city1</option> <option value="" class="dropdown-item"  selected>Seleccione</option>').selectpicker('refresh');

}