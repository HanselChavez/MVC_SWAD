<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="model.ImagenProducto"%>
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
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ProductoDAO PD = new ProductoDAO();
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Producto producto = PD.getProductById(id);
%>


<h1 class="text-4xl font-bold text-black">Detalles de Producto</h1>
<div  class="text-black my-6 flex gap-x-4 gap-y-4 flex-col  w-full">
    <div class="flex flex-col gap-y-2 max-w-[30rem]">
        <div class="flex flex-col xs:flex-row gap-0.5    justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Nombre:
            </dt>
            <dd class="text-end text-left" id="ddnombre">  
                <%=producto.getNombre()%>
            </dd>
        </div><div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Descripción:
            </dt>
            <dd class="text-end text-left" id="dddescrip">                  
                <%=producto.getDescripcion()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Categoría:
            </dt>
            <dd class="text-end text-left" id="ddcateg">    
                <%=producto.getCategoria().getNombre()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Proveedor:
            </dt>
            <dd class="text-end text-left" id="ddprov">    
                <%=producto.getProveedor().getEmpresa()%>
            </dd>
        </div>      
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Estado
            </dt>
            <dd class="text-end text-left" id="ddestado"> 
                <%=producto.getEstado().getNombre()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                P.Compra:
            </dt>
            <dd class="text-end text-left" id="ddcompra">    
                <%=producto.getPrecioCompra()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                P.Venta:
            </dt>
            <dd class="text-end text-left" id="ddventa">  
                <%=producto.getPrecioVenta()%>
            </dd>
        </div>


    </div>
    <div class="flex flex-col ">
        <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4 md:pr-4">
            <div class="flex flex-col xs:flex-row gap-0.5 relative justify-between xs:items-center w-full">
                <dt class="font-medium">
                    Imagen Principal:       
                </dt>
                <dd class="text-end text-left"<%=producto.getImagenPrincipal().substring(producto.getImagenPrincipal().lastIndexOf('\\') + 1)%>" name="imagenPrincipal" id="imagenPrincipal" class="border border-secondary-300 rounded-md">
            </div>
            <div id="previewPrincipalContainer" class="relative max-w-40 mt-2">
                <img id="previewPrincipal" src="<%=producto.getImagenPrincipal()%>"  </dd>
            </div>

            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full mt-4">
                <dt class="font-medium">
                    Imágenes Secundarias:
                </dt>
            </div>
        </div>
        <div id="secundariasContainer" class="flex gap-2 mt-4 flex-wrap">
            <% if (producto != null) { %>
            <% for (ImagenProducto ip : producto.getImagenesSecundarias()) {%>
            <div class="relative max-w-40 m-1">
                <img src="<%=ip.getImagen()%>" data-name="<%=ip.getImagen().substring(ip.getImagen().lastIndexOf('\\') + 1)%>" class="imgSecu rounded-md max-w-40" />
            </div>
            <% } %>
            <% }%>
        </div>
    </div>

</div    
<div class="flex flex-col text-white xs:flex-row w-full gap-4 justify-start items-start">
    <a href="/admin?pagina=producto" class="hover:bg-blue-800 max-w-20 cursor-pointer transition-all duration-500 bg-blue-600 
       px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Volver</a>
</div>