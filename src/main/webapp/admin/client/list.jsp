<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="model.Cliente,dao.ClienteDAO, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Clientes</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ClienteDAO C = new ClienteDAO();
    List<Cliente> lista = new LinkedList<>();
    lista = C.getClientes();
%>


<h1 class="text-black text-4xl font-bold">Clientes</h1>

<div class="my-4"> 
    <table id="tablaCliente" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>DNI</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full">
            <%
                if (lista != null) {
                    for (Cliente cl : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=cl.getId()%></td>
                <td><%= cl.getNombre()%></td>
                <td class="border-x border-stone-500"><%= cl.getApellPaterno()%> <%= cl.getApellMaterno()%></td>
                <td><%= cl.getTelefono()%></td>
                <td class="border-x border-stone-500"><%= cl.getCorreo()%></td>
                <td class="border-e border-stone-500"><%= cl.getDni()%></td>
                <td class="text-xl  flex justify-center items-center gap-2 "             
                    data-id="<%= cl.getId()%>"
                    data-nombre="<%= cl.getNombre()%>"
                    data-apPaterno="<%= cl.getApellPaterno()%>"
                    data-apMaterno="<%= cl.getApellMaterno()%>"
                    data-telf="<%= cl.getTelefono()%>"
                    data-correo="<%= cl.getCorreo()%>"
                    data-dni="<%= cl.getDni()%>">
                    <a class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       href="/admin?pagina=cliente&accion=edit&id=<%= cl.getId()%>"></a>
                    <a href="/admin?pagina=cliente&accion=details&id=<%= cl.getId()%>" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></a>
                    <a href="/admin?pagina=cliente&accion=delete&id=<%= cl.getId()%>" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>
<a href="/admin?pagina=cliente&accion=add"  class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
   px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Cliente
</a>

<script>
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaCliente').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 3, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [5, 3, 4, 6]},
                {searchable: false, targets: [0, 6]},
                {width: "18%", targets: [2, 5]},
                {width: "14%", targets: [1, 3]},
                {width: "25%", targets: [4]}


            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun cliente encontrado",
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
        const table = document.getElementById('tablaCliente');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>