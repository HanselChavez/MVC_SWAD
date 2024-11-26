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

    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Cliente cl = C.getClienteById(idParam);
%>
<h1 class="text-black text-4xl font-bold">Editar Transporte</h1>

<form action="/Cliente/edit" method="post" class="text-black my-6 flex gap-y-4 max-w-[70rem]  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
    <input id="eid" name="id" type="text" hidden="true" value="<%=cl.getId()%>">
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="eplaca" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Placa: </label>
            <input id="eplaca" name="eplaca" type="text" class="bg-transparent outline-none font-sans 
                   px-2 py-1 w-full border border-secondary-300 rounded-md " value="<%=cl.getNombre()%>">
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
            <label for="emodelo" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Modelo:</label>
            <input id="emodelo" name="emodelo" type="text" class="bg-transparent outline-none font-sans 
                   px-2 py-1 w-full border border-secondary-300 rounded-md " value="<%=cl.getApellPaterno()%>">
        </div>
    </div>
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
            <label for="emarca" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Marca:</label>
            <input id="emarca" name="emarca" type="text" class="bg-transparent outline-none 
                   px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="<%=cl.getDni()%>">
        </div> 
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
            <label for="edisc" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Descripcion:</label>
            <input id="edisc" name="edisc" type="text" class="bg-transparent outline-none 
                   px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md "value="<%=cl.getCorreo()%>">
        </div> 
    </div>

    <div class="flex text-white flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a  href="/admin?pagina=transporte"   class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
            px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Guardar Cambios</button>
    </div>
</form>
