<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("userlog") != null && session.getAttribute("userlog").toString().equals("1")) {
%>
<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <%@include file="../referencias.jsp" %>
    </head>
    <%
        String pagina = request.getParameter("pagina");
    %>
    <body class="overflow-hidden">
        <header class="min-h-24 flex items-center justify-between gap-2 bg-primario-600 text-white py-4 px-4">
            <div class="flex gap-2 items-center"><div class="hover:bg-secondary-900 rounded-full transition-all duration-500 p-2">
                    <svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" 
                         stroke-linejoin="round" class="text-2xl md:hidden   cursor-pointer text-white " height="1em" 
                         width="1em" xmlns="http://www.w3.org/2000/svg">
                    <line x1="4" x2="20" y1="12" y2="12"></line>
                    <line x1="4" x2="20" y1="6" y2="6"></line>
                    <line x1="4" x2="20" y1="18" y2="18"></line>
                    </svg>
                </div>
                <div class="max-w-24">
                    <a class="max-w-12 max-h-full text-3xl font-semibold" href="/admin?pagina=dashboard">
                        Dayanara
                    </a>
                </div>
            </div>
            <div class="flex gap-2 items-center">
                <div class="text-2xl p-2 rounded-full hover:bg-secondary-900 duration-500 transition-all cursor-pointer">
                    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em"
                         width="1em" xmlns="http://www.w3.org/2000/svg">
                    <path fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" 
                          d="M160 136c0-30.62 4.51-61.61 16-88C99.57 81.27 48 159.32 48 248c0 119.29 96.71
                          216 216 216 88.68 0 166.73-51.57 200-128-26.39 11.49-57.38 16-88 16-119.29 0-216-96.71-216-216z">

                    </path>
                    </svg>
                </div>
                <div class="relative">
                    <button style="all:unset;" onclick="clickLogButton()">
                        <i class="fa-solid fa-user text-2xl text-white cursor-pointer hover:text-black transition-all duration-500"></i>
                    </button>
                    <form method="post" action="/auth?accion=cerrar" id="logbutton"  class="hidden absolute bg-white text-black right-0 z-50 text-lg top-12 w-40 flex flex-col">
                        <button class=" transition-all text-center duration-500 w-full hover:text-white hover:bg-black
                                py-2  font-semibold"  >Cerrar Sesion</button>
                    </form>
                </div>
            </div>
        </header>
        <main class="w-full  flex min-h-[calc(100vh-96px)] relative">
            <aside class="-left-72 pt-10 bg-primario-600 transition-all duration-700 absolute md:static min-h-[calc(100vh-6rem)] 
                   min-w-64 md:block w-64  text-white ">
                <ul>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start
                           w-full hover:bg-primario  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina == null || pagina.equals("dashboard")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=dashboard">
                            <i class="fa-solid fa-chart-line text-white"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Dashboard</span>
                        </a>
                    </li>

                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start  
                           w-full hover:bg-primario rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("producto")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>"
                           href="/admin?pagina=producto">
                            <i class="fa-solid fa-boxes-stacked text-orange-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Productos</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start 
                           w-full hover:bg-primario rounded-r-3xl hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("usuario")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=usuario">
                            <i class="fa-solid fa-users-gear text-contrast-600"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Usuarios</span>
                        </a>
                    </li>

                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start 
                           w-full hover:bg-primario  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("transporte")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=transporte">
                            <i class="fa-solid fa-truck-ramp-box text-cyan-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Transporte</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start 
                           w-full hover:bg-primario rounded-r-3xl hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("categoria")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=categoria">
                            <i class="fa-solid fa-tags text-amber-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Categorias</span>
                        </a>
                    </li>    
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  w-full 
                           hover:bg-primario rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("almacen")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=almacen">                      
                            <i class="fa-solid fa-warehouse text-blue-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Almacen</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  w-full 
                           hover:bg-primario rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("venta")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>"
                           href="/admin?pagina=venta">
                            <i class="fa-solid fa-cash-register text-emerald-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Ventas</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center  gap-3 md:justify-start w-full 
                           hover:bg-primario rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("compra")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>"
                           href="/admin?pagina=compra">
                            <i class="fa-solid fa-cart-shopping text-red-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Compras</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  w-full 
                           hover:bg-primario rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("envio")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>"
                           href="/admin?pagina=envio">
                            <i class="fa-solid fa-truck-fast text-indigo-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Envios</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start  
                           w-full hover:bg-primario rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("proveedor")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=proveedor">
                            <i class="fa-solid fa-truck-field text-red-400"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Proveedores</span>
                        </a>
                    </li>                    
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start 
                           w-full hover:bg-primario rounded-r-3xl hover:text-white py-2.5 pr-2 pl-4 
                           <% if (pagina != null && pagina.equals("cliente")) { %> 
                           before:absolute before:w-1 before:content-[''] bg-primario before:h-full before:inline-block before:left-0 before:top-0 before:bg-secundario-500 text-white bg-primary-900 
                           <%}%>" href="/admin?pagina=cliente">
                            <i class="fa-solid fa-users text-yellow-500"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Clientes</span>
                        </a>
                    </li>
                </ul>
            </aside>
            <div class="bg-neutral-300 h-[calc(100vh-96px)] w-full md:w-[calc(100%-16rem)]">
                <div class="h-full overflow-y-auto p-4 y-scroll">
                    <% String view = (String) request.getAttribute("view");  %>
                    <% if (view != null) {%>
                    <jsp:include page="<%=view%>" />
                    <% } else { %>
                    <p>Página no encontrada.</p>
                    <% } %>
                </div>
            </div>
        </main>

    </body>
</html>
<%
} else {
%>

<div>
    <h2 class="text-red-500 text-4xl font-bold">
        Acceso no autorizado chupapinga
    </h2>
    <a href="/auth/login.jsp">Iniciar Sesion</a>
</div>
<%
    }
%>