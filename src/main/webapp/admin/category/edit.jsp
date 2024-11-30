<%@page import="model.Categoria,dao.CategoriaDAO, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Roles</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    CategoriaDAO C = new CategoriaDAO();
    Categoria categoria = C.getCategoryById(id);
%>

<h1 class="text-4xl font-bold">Editar Categoria</h1>
<form action="/Categories/edit" method="post" class="text-black my-6 flex gap-y-4 md:gap-y-6 flex-col xs:flex-row max-w-[30rem] flex-wrap w-full">
    <input id="eid" name="id" type="text" hidden="true" value="<%= categoria.getId()%>">             
    <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
        <label for="enombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre:</label>
        <input id="enombre" name="nombre" type="text" class=" outline-none font-sans 
               px-2 py-1 w-full border bg-transparent border-secondary-300 rounded-md" value="<%= categoria.getNombre()%>">
    </div>
    <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-start w-full">
        <label for="edescripcion" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Descripción:</label>
        <textarea id="edescripcion" name="descripcion" class="bg-transparent outline-none font-sans 
                  px-2 py-1 w-full border border-secondary-300 rounded-md" rows="4"><%= categoria.getDescripcion()%></textarea>
    </div>
    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a href="/admin?pagina=categoria" class="hover:bg-red-800 text-white cursor-pointer transition-all duration-500 bg-red-600 
           px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer text-white transition-all duration-500 bg-green-600 
                px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Guardar Cambios</button>
    </div>
</form>
