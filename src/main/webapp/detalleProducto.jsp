<%@page import="model.ImagenProducto"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat" %>

<%
    ProductoDAO PD = new ProductoDAO();
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Producto producto = PD.getProductById(id);
    if (producto == null) {
        response.sendRedirect("productos.jsp");
    }
    DecimalFormat df = new DecimalFormat("#0.00");
    String precioFormateado = df.format(producto.getPrecioVenta());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Detalles del Producto</title><%@include file="./referencias.jsp" %>
        <style>
            #imageContainer {
                position: relative;
                overflow: hidden;
                cursor: zoom-in;
            }
            #zoomImage {
                transition: transform 0.3s ease-in-out;
                transform-origin: center center;
                position: absolute;
            }
            .scroll-hidden::-webkit-scrollbar {
                width: 0;
                height: 0;
                display: none;

            }
        </style>
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
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Inicio</span>
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
                            <span class="font-sans salto md:max-w-40 xl:max-w-full ">Contáctanos</span>
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
                                <span class="font-sans salto md:max-w-40 xl:max-w-full text-black">Productos</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="/nosotros">
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
        <main >
            <div class="max-w-[1200px] mt-28 mx-auto p-5">
                <!-- Breadcrumb -->


                <div class="flex w-auto mx-auto flex-wrap md:flex-nowrap gap-5">
                    <div class="flex flex-row gap-4 items-start">
                        <div class="w-[30rem] border-gray-200 rounded-lg bg-gray-200 h-[30rem] border overflow-hidden relative" id="imageContainer">
                            <div class="flex h-full justify-center items-center object-fit hover:cursor-pointer overflow-hidden">
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
                                <img src="<%= imagenPrincipal%>" alt="<%= producto.getNombre()%>" 
                                     class="rounded-lg w-full object-cover hover:cursor-pointer transition-transform duration-300 ease-in-out"
                                     id="zoomImage">
                                <% } else {%>
                                <img src="img/default-img.jpg" alt="<%= producto.getNombre()%>" alt="Producto por defecto" 
                                     class="rounded-lg w-full object-cover hover:cursor-pointer h-full transition-transform duration-300 ease-in-out">
                                <% }%>
                            </div>
                        </div>

                        <div class="flex items-start justify-center max-h-[30rem] scroll-hidden overflow-y-auto overflow-x-hidden">
                            <div class="flex flex-col gap-2.5 cursor-pointer">
                                <div class="h-20 w-20 flex items-center justify-center border transition-all duration-500 easy-in-out hover:border-black border-gray-400 rounded-lg"
                                     data-img="<%= imagenPrincipal%>" id="selected" onmouseover="changeImage(this)"> 
                                    <img src="<%= imagenPrincipal%>" alt="Thumbnail" 
                                         class="object-fit hover:cursor-pointer" >
                                </div>

                                <%
                                    // Recorrer la lista de imágenes secundarias y mostrarlas
                                    for (ImagenProducto imagen : producto.getListaImagenes()) {
                                        if (!imagen.isEsPrincipal()) { // Solo mostrar imágenes secundarias
                                %>
                                <div class="h-20 w-20 flex items-center justify-center border transition-all duration-500 easy-in-out hover:border-black border-gray-400 rounded-lg"
                                     data-img="<%= imagen.getImagen()%>" onmouseover="changeImage(this)"> <!-- Escapar comillas simples -->
                                    <img src="<%= imagen.getImagen()%>" alt="Thumbnail" 
                                         class="object-fit hover:cursor-pointer">
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>

                    </div>

                    <!-- Right Section: Product Info -->
                    <div class="flex-1">
                        <div class="text-sm mb-4">
                            <a href="/productos" class=" text-black hover:text-blue-600 transition-all duration-500 easy-in-out">Productos</a> 
                            <span class="mx-2"> >> </span>
                            <span class="text-gray-600 "><%=producto.getNombre()%></span>
                        </div>
                        <h1 class="text-2xl font-bold"><%=producto.getNombre()%></h1>
                        <p class="text-lg text-green-600 mb-2">S/<%=precioFormateado%></p>
                        <p class="text-gray-700 mb-4"> <%=producto.getDescripcion()%></p>
                        <div class="mb-4">
                            <span class="font-bold">Cantidad:</span>
                            <input type="number" value="2" min="1" max="5" class="w-16 ml-2 border p-1 text-center">
                        </div>

                        <!-- Calificación -->
                        <div class="mb-4">
                            <span class="font-bold">Calificación:</span>
                            <div class="inline-block ml-2">
                                <span class="text-yellow-400">&#9733;</span>
                                <span class="text-yellow-400">&#9733;</span>
                                <span class="text-yellow-400">&#9733;</span>
                                <span class="text-gray-400">&#9733;</span>
                                <span class="text-gray-400">&#9733;</span>
                            </div>
                        </div>

                        <!-- Código de Producto -->
                        <p class="mb-4"><strong>Cod:</strong> PROD00<%=producto.getId()%></p>

                        <!-- Botones -->
                        <div class="flex gap-4 mb-4">
                            <a href="#" class="hover:bg-green-600 easy-in-out duration-500 transition-all bg-green-500 flex gap-2 text-white px-4 py-2 rounded-md flex items-center">
                                <i class="fa-brands fa-whatsapp text-2xl"></i>
                                Compra por Whatsapp
                            </a>
                            <button class="border easy-in-out duration-500 transition-all hover:border-red-400  px-4 py-2 rounded-md gap-2 flex items-center">
                                <i class="fa-solid fa-heart text-2xl text-red-700"></i>
                                Añadir a Favoritos
                            </button>
                        </div>

                        <!-- Compartir -->
                        <div class="flex items-center gap-3 mb-6">
                            <span class="font-bold">Compartir:</span>
                            <a href="#" class="text-blue-600"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="text-gray-600"><i class="fas fa-times"></i></a>
                        </div>

                        <!-- Características del producto -->

                    </div>
                </div>
                <p class=" border-t border-gray-400 my-4 block"></p>
                <div>
                    <h2 class="text-xl mt-4 font-bold mb-2">Características del producto</h2>
                    <ul class="ml-8 list-disc text-gray-600 flex gap-2 flex-col">
                        <li>
                            Diseño Moderno: Cama con un diseño contemporáneo que presenta una cabecera rectangular grande con detalles capitonados, aportando un toque de elegancia y sofisticación.
                        </li>
                        <li>
                            Tapizado de Calidad: Estructura y cabecera tapizadas en tela de color gris oscuro, ofreciendo una apariencia suave y una durabilidad excepcional.
                        </li>
                        <li>
                            Detalles Elegantes: La cabecera cuenta con un acabado capitoné que añade un aspecto clásico y atemporal, ideal para cualquier decoración de dormitorio.
                            Perfecto para escolares 
                        </li>
                        <li>
                            Patas Contemporáneas: Soportada por cuatro patas cilíndricas de cromo visibles que brindan un contraste moderno y mejoran la estética general de la cama.
                        </li>
                        <li>
                            Construcción Robusta: La cama está diseñada para ofrecer un soporte firme y una larga vida útil, gracias a su sólida construcción y materiales de alta calidad.
                        </li>
                    </ul>
                </div>

                <h2 class="text-xl font-bold mb-4 mt-4">Clientes que vieron este producto también vieron</h2>
                <div class="flex items-center justify-between mt-8">
                    <!-- Left Arrow -->
                    <button class="text-2xl">&#10094;</button>

                    <!-- Product Cards Row 1 -->
                    <div class="flex overflow-x-auto space-x-4">
                        <div class="min-w-[150px]">
                            <img src="img/Productos/1.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                            </div>
                        </div>
                        <div class="min-w-[150px]">
                            <img src="img/Productos/2.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                            </div>
                        </div>
                        <div class="min-w-[150px]">
                            <img src="img/Productos/3.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                            </div>
                        </div>
                        <div class="min-w-[150px]">
                            <img src="img/Productos/4.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                            </div>
                        </div>


                        <!-- Repeat for more products -->
                    </div>

                    <!-- Right Arrow -->
                    <button class="text-2xl">&#10095;</button>
                </div>

                <!-- Section 2: Tenemos más productos similares para ti -->
                <h2 class="text-xl font-bold mt-8 mb-4">Tenemos más productos similares para ti</h2>
                <div class="flex items-center justify-between mt-8">
                    <!-- Left Arrow -->
                    <button class="text-2xl">&#10094;</button>

                    <!-- Product Cards Row 2 -->
                    <div class="flex overflow-x-auto space-x-4">
                        <div class="min-w-[150px]">
                            <img src="img/Productos/7.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9733;&#9734;</span>
                            </div>
                        </div>
                        <div class="min-w-[150px]">
                            <img src="img/Productos/8.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                            </div>
                        </div>
                        <div class="min-w-[150px]">
                            <img src="img/Productos/13.png" alt="Producto" class="w-full h-40 object-cover">
                            <p class="font-bold">Dayanara</p>
                            <a href="#" class="text-purple-600 hover:text-purple-700 transition-all duration-500 easy-in-out text-lg">Cama Box gris 1.5PLZ</a>
                            <p class="text-lg font-semibold text-gray-600">$799</p>
                            <div class="flex">
                                <span class="text-yellow-400">&#9733;&#9733;&#9733;&#9734;&#9734;</span>
                            </div>
                        </div>

                        <!-- Repeat for more products -->
                    </div>

                    <!-- Right Arrow -->
                    <button class="text-2xl">&#10095;</button>
                </div>


                <div class="mx-auto border shadow-xl mt-10 p-6 ">
                    <!-- Title -->
                    <h2 class="text-2xl font-bold mb-4">Puntuación</h2>

                    <!-- General Rating Section -->
                    <div class="flex flex-row justify-between mb-4">

                        <div class="flex items-center">
                            <div>
                                <p class="text-lg">Calificación General:</p>
                                <div class="flex text-yellow-400">
                                    <!-- Star icons for rating -->
                                    <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                                </div>
                            </div>
                            <div class="text-5xl font-semibold ml-6">3/5</div>
                        </div>
                        <div class="flex justify-end ">
                            <div class="px-4 flex items-center flex-col justify-center ">
                                <p class="text-lg">60</p>
                                <p class="text-gray-600">Comentarios</p>
                            </div>
                            <div class="border-x  flex items-center flex-col justify-center border-x-black px-4">
                                <p class="text-lg">0</p>
                                <p class="text-gray-600">Preguntas</p>
                            </div>
                            <div class="px-4 flex items-center flex-col justify-center ">
                                <p class="text-lg">0</p>
                                <p class="text-gray-600">Respuestas</p>
                            </div>
                        </div>

                    </div>

                    <!-- Individual Reviews -->
                    <div class="space-y-6">
                        <!-- Review 1 -->
                        <div>
                            <div class="flex items-center space-x-2">
                                <p class="font-bold">Gian Valdivia</p>
                                <div class="flex text-yellow-400">
                                    <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                                </div>
                            </div>
                            <p class="text-gray-700">
                                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt laudantium maxime, nam totam nihil impedit ipsa aut ut voluptatibus id.
                            </p>
                        </div>

                        <!-- Review 2 -->
                        <div>
                            <div class="flex items-center space-x-2">
                                <p class="font-bold">Kelvin Vasquez</p>
                                <div class="flex text-yellow-400">
                                    <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                                </div>
                            </div>
                            <p class="text-gray-700">
                                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt laudantium maxime, nam totam nihil impedit ipsa aut ut voluptatibus id.
                            </p>
                        </div>

                        <!-- Review 3 -->
                        <div>
                            <div class="flex items-center space-x-2">
                                <p class="font-bold">Seth Lopez</p>
                                <div class="flex text-yellow-400">
                                    <span>&#9733;</span><span>&#9733;</span><span>&#9733;</span><span>&#9734;</span><span>&#9734;</span>
                                </div>
                            </div>
                            <p class="text-gray-700">
                                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Incidunt laudantium maxime, nam totam nihil impedit ipsa aut ut voluptatibus id.
                            </p>
                        </div>
                    </div>

                    <!-- More Comments Button -->
                    <div class="mt-6 mx-auto flex items-center justify-center" >
                        <button class="px-14 mx-auto font-bold  py-3 bg-gray-100 hover:bg-gray-300 transition-all duration-500 easy-in-out text-black rounded-full">
                            Ver más
                        </button>
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
                                class="selected nav-link py-1 f-link hover:text-secundario transition-all duration-500  
                                "
                                href="/"
                                >Inicio</a
                            >
                        </li>
                        <li>
                            <a
                                class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500   text-secundario"
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
        let selectedElement = document.getElementById('selected');
        selectedElement.classList.add('border-black');

        function changeImage(element) {
            // Cambiar la fuente de la imagen principal
            const url = element.getAttribute('data-img');

            // Cambiar la imagen principal
            document.getElementById('zoomImage').src = url;

            // Si hay un elemento previamente seleccionado, quitarle el borde negro
            if (selectedElement) {
                selectedElement.classList.remove('border-black');
            }

            // Agregar el borde negro al nuevo elemento seleccionado
            selectedElement = element;
            selectedElement.classList.add('border-black');
        }
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

        const imageContainer = document.getElementById("imageContainer");
        const zoomImage = document.getElementById("zoomImage");

        imageContainer.addEventListener("mousemove", (e) => {
            const {left, top, width, height} = imageContainer.getBoundingClientRect();
            const x = e.clientX - left;
            const y = e.clientY - top;

            // Activa el zoom y desplaza la imagen
            zoomImage.style.transform = "scale(1.5)";
            zoomImage.style.transformOrigin = " " + (x / width) * 100 + "% " + (y / height) * 100 + "%";
        });

        imageContainer.addEventListener("mouseleave", () => {
            // Restablece la escala al salir del área
            zoomImage.style.transform = "scale(1)";
        });

    </script>
</body>
</html>
