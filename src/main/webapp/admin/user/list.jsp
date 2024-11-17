<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.RolDAO"%>
<%@page import="model.Rol"%>
<%@page import="model.Usuario, java.util.List, java.util.LinkedList" %>
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
    UsuarioDAO C = new UsuarioDAO();
    List<Usuario> lista = new LinkedList<>();
    lista = C.getUsers();
    RolDAO R = new RolDAO();
    List<Rol> roles = new LinkedList<>();
    roles = R.getRols();
%>


<h1 class="text-black text-4xl font-bold">Usuarios</h1>
<div class="my-4"> 
    <table id="tablaUsuarios" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Dni</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Correo</th>
                <th>Rol</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full border-y-0">
            <%
                if (lista != null) {
                    for (Usuario usr : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=usr.getId()%></td>
                <td><%= usr.getDni()%></td>
                <td class="border-x border-stone-500"><%= usr.getNombres()%></td>
                <td><%= usr.getApePaterno()%>  <%=usr.getApeMaterno()%></td>
                <td class="border-x border-stone-500"><%= usr.getCorreo()%></td>
                <td class=" border-stone-500 border-e" ><%= usr.getRol().getNombre()%></td>
                <td class="text-xl flex justify-center items-center gap-2">
                    <a class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       href="/admin?pagina=proveedor&accion=edit&id=<%= usr.getId()%>"></a>
                    <a href="/admin?pagina=proveedor&accion=details&id=<%= usr.getId()%>" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></a>
                    <a href="/admin?pagina=proveedor&accion=delete&id=<%= usr.getId()%>" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>
<a href="/admin?pagina=usuario&accion=add"  class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
   px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Producto
</a>


<script>
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaUsuarios').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [1, 5, 6]},
                {searchable: false, targets: [0, 6]},
                {width: "18%", targets: [2, 3]},
                {width: "14%", targets: [1, 5]},
                {width: "20%", targets: [3, 4]}

            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun usuario encontrado",
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
        const table = document.getElementById('tablaUsuarios');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>