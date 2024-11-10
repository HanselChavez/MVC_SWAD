<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <%@include file="../referencias.jsp" %>
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <style>
            .error-input {
                border-color: #FF0000;
                color: #FF2323;
            }
        </style>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

    </head>
    <body class="min-h-screen">  
        <main class="min-h-screen bg-image w-full flex-col gap-6 flex justify-center items-center px-3">
            <div class="w-full max-w-96 bg-primario rounded-lg px-4 py-8 sm:px-8 sm:py-12">
                <h1 class="text-center font-semibold text-2xl text-white">Registrar Cuenta</h1>
                <form class="mt-4 flex flex-col gap-4" id="registerForm" action="/auth?accion=registrar" method="post">
                    <p class="font-semibold uppercase py-2 text-center bg-red-500 text-white ${empty error ? 'hidden' : ''}">
                        ${error}
                    </p>
                    <div class="flex gap-2 flex-col">
                        <label for="nombre" class="text-white">Nombre</label>
                        <input class="font-sans border rounded-sm p-2 outline-none" 
                               type="text" id="nombre" name="nombre" 
                               placeholder="Juan" 
                               value="${not empty nombre ? nombre : ''}">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="apellidos" class="text-white">Apellidos</label>
                        <input class="font-sans border rounded-sm p-2 outline-none" 
                               type="text" id="apellidos" name="apellidos" 
                               placeholder="Pérez Aliaga" 
                               value="${not empty apellidos ? apellidos : ''}">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="dni" class="text-white">DNI</label>
                        <input class="font-sans border rounded-sm p-2 outline-none" 
                               type="number" id="dni" name="dni" 
                               placeholder="123456789" 
                               value="${not empty dni ? dni : ''}">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="email" class="text-white">Correo</label>
                        <input class="font-sans border rounded-sm p-2 outline-none" 
                               type="email" id="email" name="email" 
                               placeholder="juanperez07@gmail.com" 
                               value="${not empty email ? email : ''}">
                    </div>
                    <div class="flex gap-2 flex-col">
                        <label for="telefono" class="text-white">Teléfono</label>
                        <input class="font-sans border rounded-sm p-2 outline-none" 
                               type="text" id="telefono" name="telefono" 
                               placeholder="123456789" 
                               value="${not empty telefono ? telefono : ''}">
                    </div>
                    <div class="flex gap-2 flex-col relative">
                        <label for="password" class="text-white">Contraseña</label>
                        <input autocomplete="false" class="font-sans border rounded-sm p-2 outline-none" 
                               type="password" id="password" name="password" 
                               placeholder="**********">
                    </div>
                    <input type="hidden" id="g-recaptcha-response" name="g-recaptcha-response" value="">
                    <div class="g-recaptcha" data-sitekey="6Lege1QqAAAAACWLLIf7MthI2GcHqIl3nhdQw0-M" data-action="REGISTER"></div>
                    <input type="submit" class="mt-4 transition-all duration-500 cursor-pointer bg-primario-400 hover:bg-primario-200 rounded-sm p-2 text-white font-semibold" value="Registrar"> 
                    <p class="text-sm -mt-2 text-white text-center">¿Ya tienes una cuenta? 
                        <a class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600" href="/auth/login.jsp">Inicia Sesión</a>
                    </p>
                </form>
            </div>
        </main>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.getElementById('registerForm');
                if (form) {
                    form.addEventListener('submit', (e) => {
                        e.preventDefault();  // Evitar el envío del formulario
                        if (validateForm()) {
                            e.target.submit(); // Enviar el formulario solo si la validación es exitosa
                        }
                    });
                } else {
                    console.error("El formulario no se encontró.");
                }
            });
            var email = document.getElementById("email");
            var password = document.getElementById("password");
            var dni = document.getElementById("dni");
            var nombre = document.getElementById("nombre");
            var apellidos = document.getElementById("apellidos");
            var telefono = document.getElementById("telefono");
            var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            var apellidosRegex = /^[a-zA-Z]+\s[a-zA-Z]+$/;
            document.addEventListener("DOMContentLoaded", function () {


                // Validación en tiempo real
                email.addEventListener("input", function () {
                    email.classList.toggle('error-input', !emailRegex.test(email.value));
                });
                password.addEventListener("input", function () {
                    password.classList.toggle('error-input', !passwordRegex.test(password.value));
                });

                dni.addEventListener("input", function () {
                    dni.classList.toggle('error-input', dni.value.length != 8);
                });
                nombre.addEventListener("input", function () {
                    nombre.classList.toggle('error-input', nombre.value.trim() === "");
                });
                apellidos.addEventListener("input", function () {
                    apellidos.classList.toggle('error-input', !apellidosRegex.test(apellidos.value));
                });
                telefono.addEventListener("input", function () {
                    telefono.classList.toggle('error-input', telefono.value.length != 9);
                });
            });

            async function onClick(e) {
                e.preventDefault();
                grecaptcha.enterprise.ready(async () => {
                    const token = await grecaptcha.enterprise.execute('6Lege1QqAAAAACWLLIf7MthI2GcHqIl3nhdQw0-M', {action: 'REGISTER'});
                    document.getElementById('g-recaptcha-response').value = token;
                    document.getElementById('registerForm').submit();
                });
            }

            function validateForm() {

                var valid = true;

                if (!emailRegex.test(email.value)) {
                    Toastify({
                        text: "Por favor, ingrese un correo electrónico válido.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    email.classList.add('error-input');
                    valid = false;
                }

                if (!passwordRegex.test(password.value)) {
                    Toastify({
                        text: "La contraseña debe tener al menos 8 caracteres, una mayúscula, una minúscula, un número y un carácter especial.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    password.classList.add('error-input');
                    valid = false;
                }


                if (dni.value.length != 8) {
                    Toastify({
                        text: "El DNI debe tener 8 caracteres.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    dni.classList.add('error-input');
                    valid = false;
                }
                if (telefono.value.length != 9) {
                    Toastify({
                        text: "El telefono debe tener 9 caracteres.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    telefono.classList.add('error-input');
                    valid = false;
                }
                if (nombre.value.trim() === "") {
                    Toastify({
                        text: "Por favor, ingrese su nombre.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    nombre.classList.add('error-input');
                    valid = false;
                }

                if (apellidos.value.split(" ").length < 2) {
                    Toastify({
                        text: "Por favor, ingrese su segundo apellido.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    apellidos.classList.add('error-input');
                    valid = false;
                }

                const response = grecaptcha.getResponse();
                if (response.length === 0) {
                    Toastify({
                        text: "Por favor completa el CAPTCHA.",
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    valid = false;
                }

                return valid;
            }


        </script>
    </body>
</html>