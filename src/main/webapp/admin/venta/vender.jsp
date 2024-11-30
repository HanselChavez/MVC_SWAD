<%-- 
    Document   : vender
    Created on : 20 set. 2024, 22:11:51
    Author     : Chavez
--%>

<%@page import="dao.ProductoDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="model.Producto"%>
<%@page import="java.util.LinkedList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>

    <title>Vender Productos</title>
</head>
<%
    ProductoDAO P = new ProductoDAO();
    List<Producto> lista = new LinkedList<>();
    lista = P.getProducts();
    CategoriaDAO C = new CategoriaDAO();
    List<Categoria> categorias = new LinkedList<>();
    categorias = C.getCategories();
%>
<div class="w-full flex flex-col xl:flex-row gap-4  h-full">
    <div class="xl:w-3/5 h-full">
        <input type="search" placeholder="Ingresa nombre del Producto" class="w-full outline-none py-2 px-4 rounded-full "/>
        <div class="flex gap-4 max-w-full overflow-x-auto mt-4 x-scroll pb-2">
            <button class="rounded-lg bg-white py-1 px-2 min-w-32">
                <img class="rounded-full w-12 h-12" src="https://puvesoft.co/assets/img/default.png"/>
                <p>Todos</p>
            </button>
            <%
                if (categorias != null) {
                    for (Categoria ct : categorias) {
            %>

            <button class="rounded-lg bg-white py-1 px-2 min-w-32">
                <img class="rounded-full w-12 h-12" src="https://puvesoft.co/assets/img/default.png"/>
                <p>
                    <%=ct.getNombre()%>
                </p>
            </button>
            <%                     }
                }
            %>
        </div>
        <div class="max-h-[calc(100%-180px)] mt-4 overflow-y-auto y-scroll">

            <div class="grid grid-cols-3 pr-2 w-full h-full justify-strech xl:grid-cols-4 items-start xxl:grid-cols-5 h-auto gap-4 ">
                <%
                    if (lista != null) {
                        for (Producto pr : lista) {

                %>
                <button class="border-t-4 relative flex flex-col h-full bg-white min-h-32 border-t-blue-500 rounded-md overflow-hidden">
                    <div class="max-w-[90%] mx-auto mb-4 mt-10">
                        <img src="https://puvesoft.co/assets/img/defecto.jpg"/>
                    </div>

                    <p class="absolute bg-green-400 rounded-md left-2 top-2 px-2 py-1 font-semibold text-sm">S/ <span><%=pr.getPrecioVenta()%></span></p>
                    <h2 class="text-sm font-semibold h-2/5 uppercase max-h-full flex items-center text-center justify-center xxl:text-xl w-full py-4 px-2  bg-stone-400">
                        <%= pr.getNombre()%>
                    </h2>
                </button>
                <%                     }
                    }
                %>

            </div>      
        </div>
    </div>
    <div class="xl:w-2/5 bg-primario rounded-lg h-full">
        
    </div>
</div>