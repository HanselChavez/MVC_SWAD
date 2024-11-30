<%@page import="model.Categoria,dao.CategoriaDAO, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Roles</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    CategoriaDAO C = new CategoriaDAO();
    List<Categoria> lista = new LinkedList<>();
    lista = C.getCategories();
%>


<h1 class="text-4xl font-bold">Categorias</h1>

<div class="my-4"> 
    <table id="tablaCategorias" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full border-y-0">
            <%
                if (lista != null) {
                    for (Categoria cat : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=cat.getId()%></td>
                <td><%= cat.getNombre()%></td>
                <td class="border-x border-stone-500"><%= cat.getDescripcion()%></td>           
                <td class="text-xl  flex  justify-center items-center gap-2 "             
                    data-id="<%= cat.getId()%>"
                    data-nombre="<%= cat.getNombre()%>"
                    data-descripcion="<%= cat.getDescripcion()%>">
                    <a class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       href="/admin?pagina=categoria&accion=edit&id=<%= cat.getId()%>"></a>
                    <a href="/admin?pagina=categoria&accion=details&id=<%= cat.getId()%>"class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></a>
                    <a href="/admin?pagina=categoria&accion=delete&id=<%= cat.getId()%>" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

<a href="/admin?pagina=categoria&accion=add"  class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
   px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nueva Categoria
</a>


<script>
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaCategorias').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 3]},
                {className: "text-left", targets: [2]},
                {orderable: false, targets: [0, 2, 3]},
                {searchable: false, targets: [0, 2, 3]},
                {width: "20%", targets: [1, 3]}
            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ninguna categoria encontrada",
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
        const table = document.getElementById('tablaCategorias');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>