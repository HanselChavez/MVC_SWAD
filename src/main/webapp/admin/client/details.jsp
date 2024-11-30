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
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Cliente cl = C.getClienteById(idParam);
%>


<h1 class="text-black text-4xl font-bold">Detalles de Cliente</h1>

<div  class="text-black max-w-[35rem] my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
    <div class="flex flex-col gap-y-2  w-full  ">
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Nombre:
            </dt>
            <dd class="text-end text-left" id="ddnombre">      <%=cl.getNombre()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Apell. Paterno:
            </dt>
            <dd class="text-end text-left" id="ddpaterno">      <%=cl.getApellPaterno()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Apell. Materno:
            </dt>
            <dd class="text-end text-left" id="ddmaterno">  
                <%=cl.getApellMaterno()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Telefono:
            </dt>
            <dd class="text-end text-left" id="ddtelf">      <%=cl.getTelefono()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                Correo;
            </dt>
            <dd class="text-end text-left" id="dddirec">      <%=cl.getCorreo()%>
            </dd>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
            <dt class="font-medium">
                DNI:
            </dt>
            <dd class="text-end text-left" id="dddni">      <%=cl.getDni()%>
            </dd>
        </div>


    </div>
    <div class="flex flex-col xs:flex-row w-full gap-4 justify-between">
        <a  href="/admin?pagina=cliente"   class="text-white hover:bg-blue-800 cursor-pointer transition-all duration-500 bg-blue-600 
            px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Volver</a>

    </div>
</div>