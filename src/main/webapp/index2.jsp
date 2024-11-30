<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="./referencias.jsp" %>
    </head>
    <body id="body" class="font-raleway overflow-x-hidden">     
        <%
            String pagina = request.getParameter("pagina");
        %> 
        <header class="bg-primario w-full h-24  top-0 fixed z-50 ">
            <div class="container max-w-[1200px] h-full flex justify-between p-2 md:p-4 items-center">
                <a class="w-28 xs:w-32 text-3xl text-white md:w-40" href="?pagina=inicio">
                    Dayanara
                </a>
                <div class="flex gap-2 items-center">
                    <nav class="hidden lg:flex gap-5 mr-5 text-white ">
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 flex justify-center items-center gap-2 md:justify-start" 
                           href="inicio">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina == null || pagina.equals("inicio")) { %> text-white <%}%>">Inicio</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500
                           flex justify-center items-center  gap-2 md:justify-start" href="productos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("productos")) { %> text-white <%}%>">Productos</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start" 
                           href="nosotros">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("nosotros")) { %> text-white <%}%>">Nosotros</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 
                           flex justify-center items-center  gap-2 md:justify-start" href="contactanos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full <%if (pagina != null && pagina.equals("contactanos")) { %> text-white <%}%>">Contáctanos</span>
                        </a>
                    </nav>
                    <div class="relative">
                        <button style="all:unset;" onclick="clickLogButton()">
                            <i class="fa-solid fa-user text-2xl text-white cursor-pointer hover:text-black transition-all duration-500"></i>
                        </button>
                        <div id="logbutton"  class="hidden absolute bg-white text-black right-0 top-12 w-40 flex flex-col">
                            <a class=" transition-all text-center duration-500 w-full hover:text-white hover:bg-black
                               py-2  font-semibold" href="/auth/login.jsp">Iniciar Sesion</a>
                        </div>
                    </div>

                    <div class="overflow-hidden lg:hidden">
                        <button id="showNav" class="hover:text-black text-white text-3xl flex">
                            <i class="fa-solid fa-bars"></i>
                        </button>
                        <nav id="navbar"  class="fixed min-h-screen top-0 right-0 bg-primary-300 flex flex-col max-w-96 duration-500
                             overflow-hidden w-full px-8 py-20 z-50 gap-3 translate-x-full ">
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500
                               flex justify-center items-center  gap-2 md:justify-start" href="inicio">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <% if (pagina == null || pagina.equals("inicio")) { %> text-black <%}%>">Inicio</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex 
                               justify-center items-center  gap-2 md:justify-start" href="productos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full<% if (pagina != null && pagina.equals("productos")) { %> text-black <%}%>">Productos</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="nosotros">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full <% if (pagina != null && pagina.equals("nosotros")) { %> text-black <%}%>">Nosotros</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="contactanos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full<% if (pagina != null && pagina.equals("contactanos")) { %> text-black <%}%>">Contáctanos</span>
                            </a>
                            <button id="closeNav" class="hover:text-black absolute transition-all duration-500 top-6 right-6 text-white text-3xl flex">
                                <i class="fa-solid fa-xmark"></i>
                            </button>
                        </nav>
                        <div class="overlay w-screen z-0 min-h-screen top-0 left-0 absolute bg-black opacity-40  transition-all duration-500 hidden">
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <main class=" md:pt-24 ">

        </main>
        <footer class="bg-primario py-5 px-2 px-md-0">
            <div
                class="container-fluid flex flex-col md:flex-row mx-auto text-center justify-around text-white"
                >
                <div class="text-center py-4">
                    <a
                        href="Index.html"
                        class="text-2xl md:text-3xl nav-link mb-4 font-semibold text-white inline-block"
                        >
                        Dayanara
                    </a>
                    <h4 class="text-xl md:text-2xl mb-0">Redes Sociales</h4>
                    <div class="text-4xl">
                        <a href=" " class="f-link"
                           ><i class="fa-brands fa-facebook-f"></i
                            ></a>
                        <a href="" class="f-link">
                            <i class="fa-brands fa-x-twitter"></i
                            ></a>
                        <a href="" class="f-link"
                           ><i class="fa-brands fa-instagram"></i
                            ></a>
                    </div>
                </div>
                <div class=" py-4">
                    <h4 class="text-xl md:text-2xl">Póngase en contacto con nosotros</h4>
                    <div class="flex gap-2 mt-2 flex-col text-start ps-4 font-semibold">
                        <p class="py-1 px-3 m-0">
                            <i class="fa-regular fa-envelope pe-2"></i>
                            <span> tiendavirtual@upn.com.pe</span>
                        </p>
                        <p class="py-1 px-3 m-0">
                            <i class="fa-solid fa-phone pe-2"></i
                            ><span>+51 999 222 111</span>
                        </p>
                        <p class="py-1 px-3 m-0">
                            <i class="fa-solid fa-headset pe-2"></i>
                            <span>Lun - Vie: 9am a 5pm</span>
                        </p>
                    </div>
                </div>
                <div class="py-4 ">
                    <h4 class="text-xl md:text-2xl">Enlaces Rapidos</h4>
                    <ul class="nav flex gap-2 mt-2 flex-col text-start ps-4 font-semibold">
                        <li>
                            <a
                                class="selected nav-link py-1 f-link hover:text-secundario transition-all duration-500  
                                <%if (pagina == null || pagina.equals("inicio")) { %> text-secundario <%}%>"
                                href="inicio"
                                >Inicio</a
                            >
                        </li>
                        <li>
                            <a
                                class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500  <%if (pagina != null && pagina.equals("productos")) { %> text-secundario <%}%>"
                                href="productos"
                                >Productos</a
                            >
                        </li>
                        <li>
                            <a class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500   <%if (pagina != null && pagina.equals("nosotros")) { %> text-secundario <%}%>" 
                               href="nosotros"
                               >Nosotros</a
                            >
                        </li>
                        <li>
                            <a class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500  <%if (pagina != null && pagina.equals("contactanos")) { %> text-secundario <%}%>" 
                               href="contactanos"
                               >Contáctanos</a
                            >
                        </li>
                    </ul>
                </div>
            </div>
        </footer>
        <button class="text-white rounded-full w-12 h-12 md:w-16 md:h-16 flex justify-center items-center text-center bg-primary-300 text-xl md:text-3xl fixed z-20 
                right-4 bottom-4 cursor-pointer transition-all duration-500">
            <i class="fa-solid fa-cart-shopping"></i>
        </button>
        <!--  <button class="text-white rounded-full w-12 h-12 md:w-16 md:h-16 flex justify-center items-center bg-green-500 text-2xl md:text-4xl fixed z-20  right-4 
                 bottom-20 cursor-pointer transition-all duration-500 md:bottom-24">
             <i class="fa-brands fa-whatsapp"></i>
         </button>-->
    </div>
    <script>
        const navbutton = document.getElementById('showNav');
        const closenav = document.getElementById('closeNav');
        const navBar = document.getElementById("navbar");
        const overlay = document.querySelector(".overlay");
        navbutton?.addEventListener('click', () => {
            navBar?.classList.remove('translate-x-full');
            overlay.classList.remove('hidden');
        });
        closenav?.addEventListener('click', () => {
            navBar?.classList.add('translate-x-full');
            overlay.classList.add('hidden');
        });
        overlay?.addEventListener('click', () => {
            navBar?.classList.add('translate-x-full');
            overlay.classList.add('hidden');
        });

    </script>
</body>
</html>
