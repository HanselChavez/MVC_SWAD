<%@page import="model.Categoria,dao.CategoriaDAO, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Roles</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    CategoriaDAO C = new CategoriaDAO();
    Categoria categoria = C.getCategoryById(id);
%>

<h1 class="text-4xl font-bold">Eliminar Categoria</h1>
<form action="/Categories/delete" method="post" class="text-black my-6 flex gap-y-4 md:gap-y-6 flex-col xs:flex-row max-w-[30rem] flex-wrap w-full">
    <p class="text-xl font-semibold text-center">¿Estas seguro de eliminar este registro?</p>
    <input id="did" value="<%= categoria.getId()%>" name="id" type="text" hidden="true">
    <div class="flex flex-col gap-y-2  w-full  ">               
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Nombre:
            </dt>
            <dd class="text-end text-left" >    
                <%= categoria.getNombre()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Descripcion
            </dt>
            <dd class="text-end text-left"  >    
                <%= categoria.getDescripcion()%>
            </dd>
        </div>             
    </div>
    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a href="/admin?pagina=categoria" class="hover:bg-red-800 text-white cursor-pointer transition-all duration-500 bg-red-600 
           px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer text-white transition-all duration-500 bg-green-600 
                px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Eliminar</button>
    </div>
</form>
