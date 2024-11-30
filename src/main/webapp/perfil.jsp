<%@page import="model.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("userlog") != null && session.getAttribute("userlog").toString().equals("0")) {
        String id = session.getAttribute("idUsuario").toString();
        ClienteDAO cd = new ClienteDAO();
        Cliente cl = cd.getClienteById(id);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="./referencias.jsp" %>
        <title>Inicio</title>
    </head>
    <body id="body" class="font-raleway overflow-x-hidden">     
        <header class="bg-primario w-full h-24  top-0 fixed z-50 ">
            <div class="container max-w-[1200px] h-full flex justify-between p-2 md:p-4 items-center  ">
                <a class="w-28 xs:w-32 text-3xl text-white md:w-40" href="/">
                    Dayanara
                </a>
                <div class="flex gap-2 items-center">
                    <nav class="hidden lg:flex gap-5 mr-5 text-white ">
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 flex justify-center items-center gap-2 md:justify-start" 
                           href="/inicio">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Inicio</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500
                           flex justify-center items-center  gap-2 md:justify-start" href="/productos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Productos</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start" 
                           href="/nosotros">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Nosotros</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 
                           flex justify-center items-center  gap-2 md:justify-start" href="/contactanos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Contáctanos</span>
                        </a>
                    </nav>
                    <div class="relative">
                        <button style="all:unset;" onclick="toggleLogButton()">
                            <i class="fa-solid fa-user text-2xl text-white cursor-pointer hover:text-black transition-all duration-500"></i>
                        </button>
                        <div id="logbutton" class="hidden absolute bg-white text-black right-0 top-12 w-40 flex flex-col">
                            <%
                                String userlog = (String) session.getAttribute("userlog");
                                if (userlog == null) {
                            %>
                            <a class="transition-all text-center duration-500 w-full hover:text-white hover:bg-black py-2 font-semibold" href="/auth/login.jsp">
                                Iniciar Sesión
                            </a>
                            <%
                            } else {
                                Map<String, String> rolesUrls = Map.of(
                                        "0", "/perfil.jsp",
                                        "1", "/admin?pagina=dashboard",
                                        "2", "/vendedor?pagina=dashboard",
                                        "3", "/transportista?pagina=dashboard"
                                );
                                String dashboardUrl = rolesUrls.getOrDefault(userlog, "/admin?pagina=dashboard");
                            %>
                            <a class="transition-all text-center duration-500 w-full hover:text-white hover:bg-black py-2 font-semibold" href="<%= dashboardUrl%>">
                                <%= userlog.equals("0") ? "Perfil" : "Dashboard"%>
                            </a>
                            <form method="post" action="/auth?accion=cerrar">
                                <button class="transition-all text-center duration-500 w-full hover:text-white hover:bg-black py-2 font-semibold">
                                    Cerrar Sesión
                                </button>
                            </form>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <main class="md:pt-24 flex container-fluid mx-auto">
            <!-- Sidebar -->
            <nav class="w-64 bg-gray-100 h-screen p-4">
                <h2 class="text-xl font-semibold mb-4">Mi Cuenta</h2>
                <ul class="space-y-2">
                    <li>
                        <a href="#cuenta" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Cuenta</a>
                    </li>
                    <li>
                        <a href="#general" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Información General</a>
                    </li>
                    <li>
                        <a href="#pedidos" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Mis Pedidos</a>
                    </li>
                    <li>
                        <a href="#reembolsos" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Reembolsos</a>
                    </li>
                    <li>
                        <a href="#devoluciones" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Devoluciones</a>
                    </li>
                    <li>
                        <a href="#valoraciones" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Valoraciones</a>
                    </li>
                    <li>
                        <a href="#ajustes" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Ajustes</a>
                    </li>
                    <li>
                        <a href="#centroMensajes" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Centro de Mensajes</a>
                    </li>
                    <li>
                        <a href="#sanciones" class="block p-2 text-gray-800 hover:bg-gray-300 rounded">Información sobre Sanciones</a>
                    </li>
                </ul>
            </nav>

            <!-- Main Content -->
            <div class="flex-1 p-6">
                <div id="cuenta" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Mi Cuenta</h3>
                    <p>Detalles de la cuenta...</p>
                </div>
                <div id="general" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Información General</h3>
                    <p>Información general sobre el usuario...</p>
                </div>
                <div id="pedidos" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Mis Pedidos</h3>
                    <p>Listado de pedidos realizados...</p>
                </div>
                <div id="reembolsos" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Reembolsos</h3>
                    <p>Información sobre reembolsos...</p>
                </div>
                <div id="devoluciones" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Devoluciones</h3>
                    <p>Detalles sobre devoluciones...</p>
                </div>
                <div id="valoraciones" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Valoraciones</h3>
                    <p>Valoraciones realizadas...</p>
                </div>
                <div id="ajustes" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Ajustes</h3>
                    <p>Configuraciones de la cuenta...</p>
                </div>
                <div id="centroMensajes" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Centro de Mensajes</h3>
                    <p>Mensajes recibidos y enviados...</p>
                </div>
                <div id="sanciones" class="hidden">
                    <h3 class="text-2xl font-semibold mb-4">Información sobre Sanciones</h3>
                    <p>Detalles sobre sanciones y políticas...</p>
                </div>
            </div>
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
                                text-secundario"
                                href="/"
                                >Inicio</a
                            >
                        </li>
                        <li>
                            <a
                                class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500"
                                href="/productos"
                                >Productos</a
                            >
                        </li>
                        <li>
                            <a class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500" 
                               href="/nosotros"
                               >Nosotros</a
                            >
                        </li>
                        <li>
                            <a class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500" 
                               href="/contactanos"
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
        function toggleLogButton() {
            const logButton = document.getElementById('logbutton');
            logButton.classList.toggle('hidden');
        }

        const navLinks = document.querySelectorAll('nav a');
        const contentSections = document.querySelectorAll('main > div');
        navLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const targetId = link.getAttribute('href').substring(1);
                contentSections.forEach(section => {
                    section.classList.add('hidden');
                });
                document.getElementById(targetId).classList.remove('hidden');
            });
        });
        document.getElementById('cuenta').classList.remove('hidden');

    </script>

</body>
</html>
<%
    } else {

        response.sendRedirect("/auth/error401.jsp");

    }
%>