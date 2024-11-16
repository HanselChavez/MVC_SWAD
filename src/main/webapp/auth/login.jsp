<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Login</title>
        <%@include file="../referencias.jsp" %>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
        <style>
            .error-input {
                border-color: #FF0000;
                color: #FF2323;
            }
        </style>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var email = document.getElementById("email");
                var password = document.getElementById("password");
                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
                // Validar en tiempo real el correo
                email.addEventListener("input", function () {
                    if (emailRegex.test(email.value)) {
                        email.classList.remove('error-input');
                    } else {
                        email.classList.add('error-input');
                    }
                });
                // Validar en tiempo real la contraseña
                password.addEventListener("input", function () {
                    if (passwordRegex.test(password.value)) {
                        password.classList.remove('error-input');
                    } else {
                        password.classList.add('error-input');
                    }
                });
            });

            function validateForm() {
                var email = document.getElementById("email");
                var password = document.getElementById("password");

                var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

                var valid = true;

                // Validar correo electrónico
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

                // Validar contraseña
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
        <script src="https://www.google.com/recaptcha/enterprise.js?render=6LfcDFUqAAAAAB9zMSm9CD0Fot9AMTo8jIjMkyqL"></script>
    </head>
    <body class="min-h-screen">
        <main class="min-h-screen w-full bg-image flex-col gap-6 flex justify-center items-center px-3">
            <div class="w-full max-w-96 bg-primario rounded-lg px-4 py-8 sm:px-8 sm:py-12">
                <div class="text-center">
                    <a href="/inicio" class="font-semibold text-white text-2xl">
                        Muebles Dayanara
                    </a>
                </div>
                <form class="mt-8 flex flex-col gap-4" action="/auth?accion=validar" method="post" onsubmit="return validateForm()">
                    <p class="font-semibold uppercase py-2 text-center bg-green-500 text-white ${empty success ? 'hidden' : ''}">
                        ${success}
                    </p>
                    <p class="font-semibold uppercase py-2 text-center bg-red-500 text-white ${empty error ? 'hidden' : ''}">
                        ${error}
                    </p>
                    <div class="flex gap-2 flex-col">
                        <label for="email" class="text-white">Correo</label>
                        <input class="font-sans border rounded-sm p-2 outline-none" 
                               type="text" id="email" name="correo"  
                               placeholder="juanperez07@gmail.com" 
                               value="${correo != null ? correo : ''}"
                               >
                    </div>
                    <div class="flex gap-2 flex-col relative">
                        <label for="password" class="text-white">Contraseña</label>
                        <input class="font-sans border rounded-sm p-2 outline-none"
                               type="password" id="password" name="password" 
                               value="${pass != null ? pass : ''}"
                               >
                    </div>
                    <div class="flex justify-center">
                        <div class="g-recaptcha" name="g-recaptcha-response" data-sitekey="6Lege1QqAAAAACWLLIf7MthI2GcHqIl3nhdQw0-M" data-action="LOGIN"></div>
                    </div>

                    <p class="text-sm text-blue-200">
                        <a href="forgot-password.jsp"
                           class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600">
                            ¿Has olvidado tu contraseña?
                        </a>
                    </p>
                    <input type="submit" value="Iniciar Sesión"
                           class="mt-4 transition-all duration-500 cursor-pointer bg-primario-400 hover:bg-primario-200 rounded-sm p-2 text-white font-semibold">
                    <p class="text-sm -mt-2 text-center text-white">
                        No tienes una cuenta?
                        <a href="/auth/register.jsp"
                           class="text-blue-600 transition-all duration-500 font-semibold hover:text-green-600">
                            Registrate
                        </a>
                    </p>
                </form>
            </div>
        </main>
    </body>
</html>