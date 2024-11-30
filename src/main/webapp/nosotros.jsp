<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="./referencias.jsp" %>
        <title>Nosotros</title>
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
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Inicio</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500
                           flex justify-center items-center  gap-2 md:justify-start" href="/productos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Productos</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start" 
                           href="/nosotros">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full text-white">Nosotros</span>
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
                                <span class="font-sans salto md:max-w-40 xl:max-w-full">Productos</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="/nosotros">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full text-black">Nosotros</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start" href="/contactanos">
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
            <div class="bg-primario">
                <div class="hero ">
                    <div class="min-h-[280px] flex items-center container-fluid w-auto mx-auto">
                        <div class="flex w-full lg:flex-row justify-between">
                            <div class="w-full flex flex-col lg:flex-row pt-8 px-4">
                                <div class="lg:w-5/12 intro-excerpt">
                                    <h1 class="text-white flex flex-col gap-4 mb-4 text-3xl">
                                        Sobre Nosotros
                                    </h1>
                                    <p class="mb-4 text-white opacity-50">
                                        Lorem, ipsum dolor sit amet consectetur
                                        adipisicing elit. Ullam itaque cum
                                        delectus quas vitae praesentium, fuga
                                        consequatur consectetur architecto!
                                    </p>
                                    <div class="flex gap-2 items-center">
                                        <a href="Productos.html" class="bg-secundario hover:bg-secundario-500 transition-all duration-500 px-8 py-3 rounded-full cursor-pointer">
                                            Comprar Ahora
                                        </a>
                                        <a href="contactanos.jsp" class="border-2 border-gray-400 px-8 py-3 rounded-full text-gray-400 hover:text-white hover:border-white transition-all duration-500">
                                            Contáctanos
                                        </a>
                                    </div>
                                </div>

                                <div class="hero-img-wrap lg:-top-16">
                                    <img src="img/cama-fondo.png" class="img-fluid" alt="img-fondo">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="py-14 container-fluid mx-auto text-center" id="body">
                <div>
                    <h1 class="text-primario text-2xl">
                        Nuestra identidad
                        <span class="block text-5xl">Detrás de la Marca</span>
                    </h1>
                    <p class="text-lg mt-4 text-xl">
                        En Dayanara, somos más que una tienda de camas. Somos un equipo apasionado por el sueño y el bienestar. Creemos que un buen descanso es esencial para una vida saludable y feliz. Por eso, nos dedicamos a ofrecer a nuestros clientes productos de la más alta calidad y un servicio excepcional.
                    </p>
                    <ul class="list-none pl-10 mt-4 mx-auto text-lg text-left">
                        <li>
                            <span class="font-semibold">La pasión por el sueño:</span>
                            Creemos que un buen descanso es esencial para la salud y el bienestar.
                        </li>
                        <li>
                            <span class="font-semibold">La calidad:</span>
                            Ofrecemos productos de la más alta calidad que están diseñados para brindar un apoyo y comodidad óptimos.
                        </li>
                        <li>
                            <span class="font-semibold">El servicio al cliente:</span>
                            Nos esforzamos por brindar a nuestros clientes un servicio excepcional que supere sus expectativas.
                        </li>
                        <li>
                            <span class="font-semibold">El compromiso:</span>
                            Estamos comprometidos con la comunidad y con el medio ambiente.
                        </li>
                    </ul>
                </div>
            </section>

            <section class="hero2 bg-primario py-20">
                <div class="container-fluid mx-auto text-center flex flex-col md:flex-row justify-center items-center">
                    <div class="md:w-1/3 lg:w-2/5">
                        <h2 class="text-white text-4xl">Nuestra visión</h2>
                        <p class="text-xl text-gray-400 font-light">
                            Nuestra visión es ser la tienda de camas líder en Perú, reconocida por ofrecer productos de la más alta calidad, un servicio excepcional.
                        </p>
                    </div>
                    <div class="md:w-2/3 lg:w-3/5">
                        <div class="hero-img-wrap">
                            <img src="./img/Productos/22.png" class="img-fluid max-w-[20rem] w-[30rem]" />
                        </div>
                    </div>
                </div>
            </section>

            <section class="py-4 container-fluid mx-auto text-center">
                <h2 class="w-full mt-4 text-5xl bg-white text-primario">¿Por qué elegirnos?</h2>
                <div class="features-area my-5">
                    <section class="features-area p-0 section_gap">
                        <div class="grid grid-rows-4 p-6 md:grid-rows-2 md:grid-cols-2 lg:grid-cols-4 lg:grid-rows-1 features-inner mx-auto">
                            <div class="">
                                <div class="single-features p-4">
                                    <div class="f-icon">
                                        <i class="fa-solid fa-truck text-4xl"></i>
                                    </div>
                                    <h6 class="text-xl">Entrega rápida y gratuita</h6>
                                    <p>
                                        Para tu comodidad, ofrecemos envíos gratis en todas tus compras mayores a S/1000.00, asegurando que recibas tus muebles directamente en tu hogar sin costo adicional.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-features p-4">
                                    <div class="f-icon">
                                        <i class="fa-solid fa-arrows-rotate text-4xl"></i>
                                    </div>
                                    <h6 class="text-xl">Política de devoluciones</h6>
                                    <p>
                                        Ofrecemos una política de devoluciones sencilla y sin complicaciones, asegurando que puedas comprar con total tranquilidad y confianza.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-features p-4">
                                    <div class="f-icon">
                                        <i class="fa-solid fa-headset text-4xl"></i>
                                    </div>
                                    <h6 class="text-xl">Soporte 24/7</h6>
                                    <p>
                                        Nuestro equipo está comprometido a proporcionarte una experiencia de compra sin igual, ofreciendo asesoramiento profesional y soporte en cada paso del proceso.
                                    </p>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-6 ">
                                <div class="single-features p-4">
                                    <div class="f-icon">
                                        <i class="fa-solid fa-database text-4xl"></i>
                                    </div>
                                    <h6 class="text-xl">Pago seguro</h6>
                                    <p>
                                        Garantizamos transacciones protegidas con los más altos estándares de seguridad, para que puedas realizar tus compras con total confianza y tranquilidad.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>
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
                                class="selected nav-link py-1 f-link hover:text-secundario transition-all duration-500"
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
                            <a class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500 text-secundario" 
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
