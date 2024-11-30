<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="./referencias.jsp" %>
        <title>Contáctanos</title>
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
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Productos</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 flex justify-center items-center  gap-2 md:justify-start" 
                           href="/nosotros">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full">Nosotros</span>
                        </a>
                        <a class="text-black hover:text-white font-semibold text-xl transition-all duration-500 
                           flex justify-center items-center  gap-2 md:justify-start" href="/contactanos">
                            <span class="font-sans salto md:max-w-40 xl:max-w-full text-white">Contáctanos</span>
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
                               justify-center items-center  gap-2 md:justify-start" href="/nosotros">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full">Nosotros</span>
                            </a>
                            <a class="text-white hover:text-black font-semibold text-xl transition-all duration-500 flex
                               justify-center items-center  gap-2 md:justify-start  " href="/contactanos">
                                <span class="font-sans salto md:max-w-40 xl:max-w-full text-black">Contáctanos</span>
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
                                        Contáctanos
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

            <main id="contacto-form" class="py-5 container mx-auto text-center">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6 px-4 py-4">
                    <p class="flex  items-center justify-center text-blue-900 rounded py-2 px-3 shadow-md">
                        <i class="fa-regular bg-secundario px-2 py-1 rounded-md fa-envelope text-3xl mr-2"></i>
                        <span>Mueblesdayanara@gmail.com</span>
                    </p>
                    <p class="flex items-center justify-center text-blue-900 rounded py-2 px-3 shadow-md">
                        <i class="fa-solid fa-phone bg-secundario px-2 py-1 rounded-md text-3xl mr-2"></i>
                        <span>+51 999 222 111</span>
                    </p>
                    <p class="flex items-center justify-center text-blue-900 rounded py-2 px-3 shadow-md">
                        <i class="fa-solid fa-headset bg-secundario px-2 py-1 rounded-md text-3xl mr-2"></i>
                        <span>Lun - Vie: 10am a 10pm</span>
                    </p>
                </div>
                <h2 class="text-5xl bg-white text-blue-900 mb-6">Contáctanos</h2>
                <form class="grid  text-left md:grid-cols-2 gap-4 w-full max-w-4xl mx-auto px-4">
                    <div class=" form-floating mb-2 md:mb-0">
                        <label for="floatingFirst" class="text-gray-600">Nombre</label>
                        <input type="text" class="rounded-md form-input w-full px-4 py-3 border border-gray-300" id="floatingFirst" placeholder=" " />
                    </div>
                    <div class="form-floating mb-2 md:mb-0">
                        <label for="floatingLast" class="text-gray-600">Apellido</label>
                        <input type="text" class="rounded-md form-input w-full px-4 py-3 border border-gray-300" id="floatingLast" placeholder=" " />
                    </div>
                    <div class="form-floating mb-2 col-span-2">
                        <label for="floatingEmail" class="text-gray-600">Correo</label>
                        <input type="email" class="rounded-md form-input w-full px-4 py-3 border border-gray-300" id="floatingEmail" placeholder=" " />
                    </div>
                    <div class="form-floating mb-2 col-span-2">
                        <label for="floatingMessage" class="text-gray-600">Mensaje</label>
                        <input class="form-input w-full rounded-md px-4 py-3 border border-gray-300" rows="5" id="floatingMessage" placeholder=" "/>
                    </div>
                    <button class="col-span-2 inline-block bg-primario-200 w-[15rem] hover:bg-primario-400 text-white transition-all duration-500 px-8 py-3 rounded-full cursor-pointer" type="submit">Enviar Mensaje</button>
                </form>
            </main>

            <iframe    
                title="mapa"
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3902.40521117748!2d-76.8889587!3d-12.0156003!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105e9bd9393c10d%3A0x6ce3f066d3184746!2sTOP%20DECOR%20MUEBLES!5e0!3m2!1ses-419!2spe!4v1716951564363!5m2!1ses-419!2spe"
                width="100%"
                height="480px"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade">
            </iframe>        </main>
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
                            <a class=" nav-link py-1 f-link hover:text-secundario transition-all duration-500 text-secundario" 
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
