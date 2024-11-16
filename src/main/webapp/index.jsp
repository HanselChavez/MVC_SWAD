<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                            <span class="font-sans salto md:max-w-40 xl:max-w-full text-white">Inicio</span>
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
        <main class=" md:pt-24 ">
            <div class="bg-primario">
                <div class="hero  ">
                    <div class="min-h-[280px] flex items-center container-fluid w-auto mx-auto">
                        <div class=" flex w-full lg:flex-row justify-beetwen">
                            <div class="w-full flex flex-col lg:flex-row pt-8 px-4 ">
                                <div class=" lg:w-5/12 intro-excerpt">
                                    <h1 class="text-white lg:flex flex-col gap-4 mb-4 text-3xl ">
                                        Tu Refugio
                                        <span clsas="block py-2">de Confort</span>
                                    </h1>
                                    <p class="mb-4 text-white opacity-50">
                                        Lorem, ipsum dolor sit amet consectetur
                                        adipisicing elit. Ullam itaque cum
                                        delectus quas vitae praesentium, fuga
                                        consequatur consectetur architecto!
                                    </p>
                                    <div class="flex gap-2 items-center">
                                        <a href="?pagina=productos" class="bg-secundario hover:bg-secundario-500 transition-all duration-500 px-8 py-3 rounded-full cursor-pointer">Comprar Ahora</a>
                                        <a href="?pagina=contactanos" class="border-2 border-gray-400 px-8 py-3 rounded-full text-gray-400 hover:text-white hover:border-white transition-all duration-500 ">Contáctanos</a>
                                        </p>
                                    </div>
                                </div>

                                <div class="hero-img-wrap">
                                    <img src="img/cama-fondo.png" class="img-fluid" alt="img-fondo">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="py-4 container-fluid mx-auto text-center"> 
                <section class="features-area section_gap">
                    <div class="grid grid-rows-4 md:grid-rows-2 md:grid-cols-2 lg:grid-cols-4 lg:grid-rows-1 features-inner mx-auto">
                        <div class="">
                            <div class="single-features">
                                <div class="f-icon">
                                    <i class="fa-solid fa-truck"></i>
                                </div>
                                <h6>Entrega gratis</h6>
                                <p>En órdenes mayores a S/1000.00</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <i class="fa-solid fa-arrows-rotate"></i>
                                </div>
                                <h6>Política de devoluciones</h6>
                                <p>Devoluciones sin complicaciones.</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <i class="fa-solid fa-headset"></i>
                                </div>
                                <h6>Soporte 24/7</h6>
                                <p>Asistencia en cualquier momento.</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-features">
                                <div class="f-icon">
                                    <i class="fa-solid fa-database"></i>
                                </div>
                                <h6>Pago seguro</h6>
                                <p>TransAcciónes protegidas.</p>
                            </div>
                        </div>
                    </div>
                </section>

                <div>
                    <h2 class="text-primario font-semibold text-2xl md:text-4xl">
                        Elaborado con excelente material.
                    </h2>
                    <p class="text-xl mt-4">
                        Donec vitae odio quis nisl dapibus malesuada. Nullam ac
                        aliquet velit. Aliquam vulputate velit imperdiet dolor
                        tempor tristique. Lorem ipsum dolor sit amet consectetur,
                        adipisicing elit. Aliquam quam ab suscipit nulla eaque
                        quisquam iusto error id corporis perferendis eligendi, rem
                        quo? Aperiam minima rem, officia est veniam obcaecati!
                    </p>
                </div>
                <div class="grid md:grid-cols-2 mt-4 lg:grid-cols-3 justify-center">
                    <div class="product-card ">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/1.png" width="90%" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/2.png" width="90%" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500 btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/3.png" width="90%" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn  rounded-full text-white hover:text-black transition-all duration-500 btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/4.png" width="90%" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/5.png" width="90%" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/6.png" width="90%" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/7.png" width="90%" alt="Box 1" height="auto">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
                    </div>
                    <div class="product-card col-md-4 col-sm-6 col-12 p-1">
                        <div class="bg-image-color py-2">
                            <img src="./img/Productos/8.png" width="90%" height="auto" alt="Box 1">
                        </div>
                        <a href="ProductosDetalle.html" class="nav-link roboto-bold fs-6 titulo-carta">
                            Cama Deluxe Para
                        </a>
                        <p class="roboto-black product-price">S/ 1000.00</p>
                        <button class="btn rounded-full text-white hover:text-black transition-all duration-500  btn-agregar">Agregar al Carrito</button>
                    </div>
                </div>
            </section>

            <section class="hero2 bg-primario py-10">
                <div
                    class="container max-w-[1200px] gap-4 text-center px-4 flex flex-col md:flex-row justify-center items-center mx-auto"
                    >
                    <div class="md:w-6/12 lg:w-5/12">
                        <h2 class="text-white text-2xl md:text-3xl">
                            Dayanara: Más de 10 años creando sueños.
                        </h2>
                        <p class=" text-gray-400 text-lg md:text-xl inter-thin">
                            Más de 10 años creando sueños en Santa Clara, Lima. Te
                            ofrecemos camas, dormitorios, colchones, box springs y
                            veladores de calidad con garantía. Disfruta de una
                            excelente atención al cliente y la asesoría de nuestros
                            expertos para encontrar la cama perfecta para tu
                            descanso.
                        </p>
                    </div>
                    <div class="md:w-6/12 lg:w-7/12">
                        <div class="hero-img-wrap">
                            <img
                                src="./img/Productos/13.png"
                                alt="img-producto"
                                class="img-fluid w-full"
                                />
                        </div>
                    </div>
                </div>
            </section>
            <section>
                <div class="container-fluid mx-auto product-section my-8">
                    <h2 class="text-center text-xl md:text-3xl font-semibold text-primario">
                        Pedidos Especiales
                    </h2>

                    <p class="text-center text-lg mt-4">
                        En caso estés buscando algún producto en específico y
                        nosotros no lo tengamos en stock, puedes solicitar una
                        cotización enviándonos todos los detalles del producto.
                    </p>
                    <div class="grid grid-rows-3 md:grid-rows-1  md:grid-cols-3 gap-6 mt-6 justify-center mb-8">
                        <div class="border max-w-[250px] md:max-w-[350px] border-gray-300 rounded-md md:px-4 p-2 pb-5">
                            <div class="card">
                                <img
                                    src="./img/Productos/14.png"
                                    class="card-img-top"
                                    alt="Cama Box Queen"
                                    width="auto"
                                    />
                                <div class="card-body grid justify-beetwen h-[200px]">
                                    <h5 class="font-semibold md:text-lg">Cama Box Queen</h5>
                                    <p class="card-text text-gray-700">
                                        Disfruta del máximo confort y estilo con
                                        nuestra Cama Box Queen
                                    </p>
                                    <a
                                        href="ProductosDetalle.html"
                                        class="btn text-center place-self-end	inline-block  text-white font-semibold btn-primario w-auto rounded-full mx-auto transition-all duration-500"
                                        >Solicita cotización</a
                                    >
                                </div>
                            </div>
                        </div>
                        <div class="border max-w-[250px] md:max-w-[350px] border-gray-300 rounded-md md:px-4 p-2 pb-5">
                            <div class="card h-100 ">
                                <img
                                    src="./img/Productos/15.png"
                                    class="card-img-top"
                                    alt="Cama Box King"
                                    width="auto"
                                    />
                                <div class="card-body grid justify-beetwen h-[200px]">
                                    <h5 class="font-semibold md:text-lg">Cama Box King</h5>
                                    <p class="card-text text-gray-700">
                                        Con su amplio tamaño King, es perfecta para
                                        quienes buscan un descanso espacioso y
                                        reparador.
                                    </p>
                                    <a
                                        href="ProductosDetalle.html"
                                        class="btn text-center self-end  inline-block  text-white font-semibold btn-primario w-auto rounded-full mx-auto transition-all duration-500"
                                        >Solicita cotización</a
                                    >
                                </div>
                            </div>
                        </div>
                        <div class="border max-w-[250px] md:max-w-[350px] border-gray-300 rounded-md md:px-4 p-2 pb-5">
                            <div class="card ">
                                <img
                                    src="./img/Productos/21.png"
                                    class="card-img-top"
                                    alt="Cama Box Ergonomica"
                                    width="auto"
                                    />
                                <div class="card-body grid justify-beetwen h-[200px]">
                                    <h5 class="font-semibold md:text-lg">Cama Box Ergonomica</h5>
                                    <p class="card-text text-gray-700">
                                        Ideal para mejorar la postura y reducir los
                                        puntos de presión.
                                    </p>
                                    <a
                                        href="ProductosDetalle.html"
                                        class="btn text-center inline-block  self-end text-white font-semibold btn-primario w-auto rounded-full mx-auto transition-all duration-500"
                                        >Solicita cotización</a
                                    >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <iframe
                title="mapa"
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3902.40521117748!2d-76.8889587!3d-12.0156003!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105e9bd9393c10d%3A0x6ce3f066d3184746!2sTOP%20DECOR%20MUEBLES!5e0!3m2!1ses-419!2spe!4v1716951564363!5m2!1ses-419!2spe"
                width="100%"
                height="480px"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
                ></iframe>


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
    </script>
</body>
</html>
