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
    ProductoDAO PD = new ProductoDAO();
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Producto product = PD.getProductById(id);
%>

<h1 class="text-4xl font-bold text-black">Eliminar Producto</h1>


<form action="/Producto/delete" method="post" class="text-black max-w-[35rem] my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
    <p class="text-xl font-semibold text-center">¿Estas seguro de eliminar este producto?</p>
    <input id="did" name="id" type="text" value=" <%= product.getId()%>" hidden="true">
    <div class="flex flex-col gap-y-2  w-full  ">
        <div class="flex flex-col gap-y-2 w-full">
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">Nombre:</dt>
                <dd class="text-end text-left" id="dnombre">
                    <%= product.getNombre()%>
                </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">Descripción:</dt>
                <dd class="text-end text-left" id="ddescrip">
                    <%= product.getDescripcion()%>
                </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">Categoría:</dt>
                <dd class="text-end text-left" id="dcateg">
                    <%= product.getCategoria().getNombre()%>
                </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">Proveedor:</dt>
                <dd class="text-end text-left" id="dprov">
                    <%= product.getProveedor().getEmpresa()%>
                </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">Estado:</dt>
                <dd class="text-end text-left" id="destado">
                    <%= product.getEstado().getNombre()%>
                </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">P. Compra:</dt>
                <dd class="text-end text-left" id="dcompra">
                    <%= product.getPrecioCompra()%>
                </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <dt class="font-medium">P. Venta:</dt>
                <dd class="text-end text-left" id="dventa">
                    <%= product.getPrecioVenta()%>
                </dd>
            </div>
        </div>
    </div>
    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a href="/admin?pagina=producto"type="button" class="text-white hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
           px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer text-white transition-all duration-500 bg-green-600 
                px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Eliminar</button>
    </div>
</form>
