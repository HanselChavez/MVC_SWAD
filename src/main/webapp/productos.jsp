<%@page import="model.ImagenProducto"%>
<%@page import="model.Producto"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.Categoria"%>
<%@page import="dao.CategoriaDAO"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="./referencias.jsp" %>
        <title>Productos</title>
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
                           href="/">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Inicio</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500
                           flex justify-center items-center  gap-2 md:justify-start" href="/productos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full text-white">Productos</span>
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
                               flex justify-center items-center  gap-2 md:justify-start" href="/">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full">Inicio</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex 
                               justify-center items-center  gap-2 md:justify-start" href="/productos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full text-black ">Productos</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start" href="/nosotros">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full">Nosotros</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="/contactanos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full">Contáctanos</span>
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

            <div class="flex">
                <div class="w-2/12 p-4 bg-gray-100">
                    <div class="mb-4">
                        <label for="price" class="block text-sm font-medium text-gray-700">Price</label>
                        <input id="price" type="range" class="w-full h-2 bg-gray-300 rounded-lg appearance-none cursor-pointer" min="0" max="500" step="10">
                        <span class="text-sm text-gray-500">$340</span>
                    </div>

                    <!-- Filtro por Color -->
                    <div class="mb-7">
                        <h3 class="text-sm font-medium text-gray-700">Filtrar por Color</h3>
                        <div class="flex flex-col space-y-2">
                            <label class="inline-flex items-center">
                                <input type="checkbox" class="form-checkbox text-blue-500" value="rojo">
                                <span class="ml-2 text-gray-700">Rojo</span>
                            </label>
                            <label class="inline-flex items-center">
                                <input type="checkbox" class="form-checkbox text-blue-500" value="azul">
                                <span class="ml-2 text-gray-700">Azul</span>
                            </label>
                            <label class="inline-flex items-center">
                                <input type="checkbox" class="form-checkbox text-blue-500" value="verde">
                                <span class="ml-2 text-gray-700">Verde</span>
                            </label>
                        </div>
                    </div>
                </div>

                <div class="w-10/12 p-4">           
                    <div class="flex items-start w-full justify-end gap-1 mb-4 font-semibold">
                        <%-- Suponiendo que tienes una lista de categorías --%>
                        <%
                            // Obtenemos la lista de categorías desde el DAO
                            List<Categoria> categorias = new CategoriaDAO().getCategories();
                            long categoriaSeleccionada = 0;
                            String categoriaParam = request.getParameter("idCategoria");
                            if (categoriaParam != null) {
                                categoriaSeleccionada = Long.parseLong(categoriaParam);
                            }
                        %>
                        <form method="get" action="/productos" style="display:inline;"> 
                            <input type="hidden" name="" value="">
                            <button type="submit" 
                                    class="px-3 py-1 outline-none 
                                    <% if (0 == categoriaSeleccionada) { %>
                                    border-b-yellow-500 border-b-4 text-yellow-500
                                    <% } else { %>
                                    bg-white hover:border-b-yellow-500 hover:text-yellow-500 border-b-4 border-b-transparent transition-all duration-500 text-gray-700
                                    <% }%>">
                                Todos
                            </button>
                        </form>
                        <% for (Categoria categoria : categorias) {%>
                        <form method="get" action="/productos" style="display:inline;"> 
                            <input type="hidden" name="idCategoria" value="<%= categoria.getId()%>">
                            <button type="submit" 
                                    class="px-3 py-1 outline-none 
                                    <% if (categoria.getId() == categoriaSeleccionada) { %>
                                    border-b-yellow-500 border-b-4 text-yellow-500
                                    <% } else { %>
                                    bg-white hover:border-b-yellow-500 hover:text-yellow-500 border-b-4 border-b-transparent transition-all duration-500 text-gray-700
                                    <% }%>">
                                <%= categoria.getNombre()%>
                            </button>
                        </form>
                        <% }%>
                    </div>

                    <%
                        // Obtener el idCategoria de los parámetros
                        String idCategoriaParam = request.getParameter("idCategoria");
                        long idCategoria = 0; // Por defecto, mostrar todos los productos
                        if (idCategoriaParam != null) {
                            idCategoria = Long.parseLong(idCategoriaParam);
                        }

                        // Obtener los productos según la categoría seleccionada
                        List<Producto> productos;
                        if (idCategoria > 0) {
                            productos = new ProductoDAO().getProductosByCategoriaId(idCategoria);
                        } else {
                            productos = new ProductoDAO().getProducts(); // Método que obtiene todos los productos
                        }
                    %>
                    <div class="grid grid-cols-3 xl:grid-cols-4 gap-5 auto-rows-max">
                        <% for (Producto producto : productos) {%>
                        <div class="p-4 bg-white border text-center shadow rounded">
                            <a href="/detalle?id=<%= producto.getId()%>" class="text-xl hover:text-yellow-600 font-bold transition-all duration-500 easy-in-out">
                                <%= producto.getNombre()%>
                            </a>
                            <div class="flex items-center justify-center object-fit overflow-hidden">
                                <%
                                    // Recorrer la lista de imágenes del producto
                                    String imagenPrincipal = null;
                                    for (ImagenProducto imagen : producto.getListaImagenes()) {
                                        if (imagen.isEsPrincipal()) {
                                            imagenPrincipal = imagen.getImagen(); // Obtener la URL de la imagen principal
                                            break; // Salir del bucle cuando se encuentra la imagen principal
                                        }
                                    }
                                %>
                                <% if (imagenPrincipal != null) {%>
                                <img src="<%= imagenPrincipal%>" 
                                     alt="Producto" 
                                     class="rounded-lg my-4 mx-auto h-auto object-cover">
                                <% } else { %>
                                <img src="/img/default-img.jpg" 
                                     alt="Producto por defecto" 
                                     class="rounded-lg my-4 mx-auto h-auto object-cover">
                                <% }%>
                            </div>
                            <h6 class="text-lg font-medium text-gray-600"><%= producto.getDescripcion()%></h6>
                            <p class="text-center font-semibold text-lg">S/<%= producto.getPrecioVenta()%></p>
                        </div>
                        <% }%>
                    </div>
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
                                class="selected nav-link py-1 f-link hover:text-secundario transition-all duration-500"
                                href="/"
                                >Inicio</a
                            >
                        </li>
                        <li>
                            <a
                                class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500 text-secundario"
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
    </script>
</body>
</html>
