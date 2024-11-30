
<%@page import="dao.VentasDAO"%>
<%@page import="model.Venta"%>
<%@page import="model.Usuario"%>


<%@page import="java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Envios</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    VentasDAO V = new VentasDAO();
    List<Venta> lista = new LinkedList<>();
    lista = V.getVentas();
%>

<h1 class="text-black text-4xl font-bold">Envios</h1>
<div class="my-4"> 
    <table id="tablaTransporte" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Codigo</th>
                <th>Vendedor</th>
                <th>Fecha</th>
                <th>Trasnportista</th>
                <th>Total</th>
                <th>Opciones</th>

            </tr>
        </thead>
        <tbody class="min-w-full border-y-0">
            <%
                if (lista != null) {
                    for (Venta vt : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=vt.getId()%></td>
                <td><%= vt.getId()%></td>
                <td class="border-x border-stone-500"><%= vt.getEmpleado().getNombres()%> 
                    <%= vt.getEmpleado().getApePaterno()%> <%= vt.getEmpleado().getApeMaterno()%></td>
                <td><%= vt.getFecha()%>  </td>
                
                <td class="border-x border-stone-500"><%= vt.getTotal()%></td>
                <td class="text-xl flex justify-center items-center gap-2 "             
                    data-id="<%= vt.getId()%>"
                    data-empleado="<%= vt.getEmpleado().getId()%>"
                    data-fecha ="<%= vt.getFecha()%>"
                    data-total="<%= vt.getTotal()%>">
                    <i class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       onclick="editUser(this.parentElement)"></i>
                    <i onclick="detailsUser(this.parentElement)" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></i>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>
<script>
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaTransporte').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 5]},
                {orderable: false, targets: [1, 5]},
                {searchable: false, targets: [0]},
                {width: "10%", targets: [1, 5, 3, 4]},
                {width: "20%", targets: [2]}

            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun transporte encontrado",
                infoEmpty: "No hay registros disponibles",
                infoFiltered: "(filtrando desde _MAX_ registros totales)",
                info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros."
            }
        });
        // Crea un nuevo div
        const div = document.createElement('DIV');
        // div.classList.add('overflow-auto');
        div.classList.add('snap-none');
        div.classList.add('scroll-p-0');
        div.classList.add('w-full');
        div.classList.add('rounded-md');
        div.classList.add('tabla-citas');
        div.id = 'newParentDiv';
        // Obtén la tabla original
        const table = document.getElementById('tablaTransporte');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>