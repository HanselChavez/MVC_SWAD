<%@page import="dao.ProveedorDAO"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="dao.CompraDAO"%>
<%@page import="dao.TransporteDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.VentasDAO"%>
<%@page import="model.Proveedor"%>
<%@page import="model.Compra"%>
<%@page import="model.Venta"%>
<%@page import="model.Categoria"%>
<%@page import="model.Transporte"%>
<%@page import="model.Producto"%>
<%@page import="model.Cliente"%>
<%@page import=" java.util.List, java.util.LinkedList" %>
<%@page import="model.Usuario" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%  
    ClienteDAO C = new ClienteDAO();
    List<Cliente> clientes = new LinkedList<>();
    clientes = C.getClientes();
    
    TransporteDAO T = new TransporteDAO();
    List<Transporte> transporte = new LinkedList<>();
    transporte = T.getTransportes(); 
%>
<h1 class="text-black text-4xl font-bold my-5">Dashboard</h1>

<div class="flex flex-wrap gap-4">
            
    <div class="flex  w-full sm:max-w-[18rem] md:max-w-[20rem] gap-6 rounded-md items-center justify-between  bg-secondary-800 p-6 border-l-8 border-l-yellow-500">
        <div class="">
            <h2 class="text-lg text-secondary-300 font-semibold uppercase">
                Clientes
            </h2>
            <p class="text-white font-semibold text-4xl">
                <%=clientes.size()%>
            </p>
        </div>
        <div>
            <i class="fa-solid fa-users text-[3.4rem] text-yellow-500"></i>
        </div>
    </div>

    <div class="flex  w-full sm:max-w-[18rem] md:max-w-[20rem] gap-6 rounded-md items-center justify-between  bg-secondary-800 p-6 border-l-8 border-l-cyan-500">
        <div class="">
            <h2 class="text-lg text-secondary-300 font-semibold uppercase">
                Rutas
            </h2>
            <p class="text-white font-semibold text-4xl">
            </p>
        </div>
        <div>
            <i class="fa-solid fa-route text-[4rem] text-cyan-500"></i>
        </div>
    </div>    
    
    <div class="flex  w-full sm:max-w-[18rem] md:max-w-[20rem] gap-6 rounded-md items-center justify-between  bg-secondary-800 p-6 border-l-8 border-l-indigo-500">
        <div class="">
            <h2 class="text-lg text-secondary-300 font-semibold uppercase">
                Envios
            </h2>
            <p class="text-white font-semibold text-4xl">
            </p>
        </div>
        <div>
            <i class="fa-solid fa-truck-fast text-[4rem] text-indigo-500"></i>
        </div>
    </div>
            
    <div class="flex  w-full sm:max-w-[18rem] md:max-w-[20rem] gap-6 rounded-md items-center justify-between  bg-secondary-800 p-6 border-l-8 border-l-red-400">
        <div class="">
            <h2 class="text-lg text-secondary-300 font-semibold uppercase">
                Transportes
            </h2>
            <p class="text-white font-semibold text-4xl">
                <%=transporte.size()%>
            </p>
        </div>
        <div>
            <i class="fa-solid fa-truck-field text-[4rem] text-red-400"></i>
        </div>
    </div>
            
        <div class="flex  w-full sm:max-w-[18rem] md:max-w-[20rem] gap-6 rounded-md items-center justify-between  bg-secondary-800 p-6 border-l-8 border-l-cyan-500">
        <div class="">
            <h2 class="text-lg text-secondary-300 font-semibold uppercase">
                Reportes
            </h2>
            <p class="text-white font-semibold text-4xl">
            </p>
        </div>
        <div>
            <i class="fa-solid fa-file text-[4rem] text-cyan-500"></i>
        </div>
    </div>
            
</div>        
                  

