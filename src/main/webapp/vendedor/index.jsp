
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("userlog") != null && session.getAttribute("userlog").toString().equals("2")) {
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
    <body class="overflow-hidden bg-secondary-900 ">
        <header class="min-h-24 flex items-center justify-between gap-2 bg-secondary-800 text-white py-4 px-4">
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
                    <a class="max-w-12 max-h-full text-3xl font-semibold" href="/vendedor?pagina=dashboard">
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
                        <i class="fa-solid  fa-user text-2xl text-white cursor-pointer hover:text-black transition-all duration-500"></i>
                    </button>
                    <form method="post" action="/auth?accion=cerrar" id="logbutton"  class="hidden absolute bg-white text-black right-0 z-50 text-lg top-12 w-40 flex flex-col">
                        <button class=" transition-all text-center duration-500 w-full hover:text-white hover:bg-black
                                py-2  font-semibold"  >Cerrar Sesion</button>
                    </form>
                </div>
            </div>
        </header>
        <main class="w-full flex min-h-[calc(100vh-6rem)] relative">
            <aside class="-left-72 bg-secondary-800 transition-all duration-700 absolute md:static min-h-[calc(100vh-6rem)]
                   min-w-64 md:block w-64  text-white ">
                <ul>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex  items-center  gap-3 md:justify-start
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina == null || pagina.equals("dashboard")) { %>
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900
                           <%}%>"  href="/vendedor?pagina=dashboard">
                            <svg stroke="currentColor" fill="white" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 -960 960 960" width="1em" >
                            <path d="M520-600v-240h320v240H520ZM120-440v-400h320v400H120Zm400 320v-400h320v400H520Zm-400 0v-240h320v240H120Z"/></svg>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Dashboard</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center
                           gap-3 md:justify-start  w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("productos")) { %>
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900
                           <%}%>"
                           href="/vendedor?pagina=productos">
                            <i class="fa-solid fa-boxes-stacked text-white"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Productos</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("ventas")) { %>
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900
                           <%}%>"
                           href="/vendedor?pagina=ventas">
                            <i class="fa-solid fa-cash-register text-white"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Ventas</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("almacen")) { %>
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900
                           <%}%>"
                           href="/vendedor?pagina=almacen">
                            <i class="fa-solid fa-warehouse text-white"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Almacen</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("cliente")) { %>
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900
                           <%}%>"
                           href="/vendedor?pagina=cliente">
                            <i class="fa-solid fa-users text-white"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Clientes</span>
                        </a>
                    </li>
                    <li class="pr-8 relative">
                        <a class="text-secondary-300 font-semibold transition-all duration-500 flex items-center gap-3 md:justify-start
                           w-full hover:bg-secondary-900  rounded-r-3xl  hover:text-white py-2.5 pr-2 pl-4
                           <% if (pagina != null && pagina.equals("envios")) { %>
                           before:absolute before:w-1 before:content-[''] bg-secondary-900 before:h-full before:inline-block before:left-0 before:top-0 before:bg-blue-600 text-white bg-primary-900
                           <%}%>"
                           href="/vendedor?pagina=envios">
                            <i class="fa-solid fa-truck-fast text-white"></i>
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Envios</span>
                        </a>
                    </li>
                                     
                </ul>
            </aside>
               <div class="bg-neutral-300 p-4 w-full md:w-[calc(100%-16rem)]">
                <div class="h-full ">
                    <% String view = (String) request.getAttribute("view");  %>
                    <% if (view != null) {%>
                    <jsp:include page="<%= view%>" />
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
        response.sendRedirect("../auth/login.jsp");
    }
%>