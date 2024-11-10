<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="dao.EstadoProductoDAO"%>
<%@page import="dao.ProveedorDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.EstadoProducto"%>
<%@page import="model.Proveedor"%>
<%@page import="model.Categoria"%>
<%@page import="model.Producto, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Productos</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ProductoDAO C = new ProductoDAO();
    List<Producto> lista = new LinkedList<>();
    lista = C.getProducts();
    CategoriaDAO CT = new CategoriaDAO();
    List<Categoria> categorias = new LinkedList<>();
    categorias = CT.getCategories();
    ProveedorDAO P = new ProveedorDAO();
    List<Proveedor> proveedores = new LinkedList<>();
    proveedores = P.getProveedores();
    EstadoProductoDAO EP = new EstadoProductoDAO();
    List<EstadoProducto> estados = new LinkedList<>();
    estados = EP.getEstados();
%>


<h1 class="text-4xl font-bold text-black">Productos</h1>
<div class="my-4"> 
    <table id="tablaProducto" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">ID</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Categoría</th>
                <th>Proveedor</th>
                <th>Prec. Compra</th>
                <th>Prec. Venta</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full border-y-0">
            <%
                if (lista != null) {
                    for (Producto prd : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=prd.getId()%></td>
                <td><%= prd.getNombre()%></td>
                <td class="border-x border-stone-500"><%= prd.getDescripcion()%></td>
                <td><%= prd.getCategoria().getNombre()%></td>
                <td class="border-x border-stone-500"><%= prd.getProveedor().getEmpresa()%></td>
                <td><%= prd.getPrecioCompra()%></td>
                <td class="border-x border-stone-500"><%= prd.getPrecioVenta()%></td>

                <td class="text-xl flex justify-center items-center gap-2">
                    <a class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       href="/admin?pagina=producto&accion=edit&id=<%= prd.getId()%>"></a>
                    <a href="/admin?pagina=producto&accion=details&id=<%= prd.getId()%>" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></a>
                    <a href="/admin?pagina=producto&accion=delete&id=<%= prd.getId()%>" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

<a href="/admin?pagina=producto&accion=add"  class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
   px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Producto
</a>

<script>
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaProducto').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [7]},
                {searchable: false, targets: [0, 6]},
                {width: "18%", targets: [1, 2]},
                {width: "12%", targets: [7]}
            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun producto encontrado",
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
        const table = document.getElementById('tablaProducto');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>