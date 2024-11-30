<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html >
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <%@include file="../referencias.jsp" %>
        <title>Invalid Session</title>
    </head>
    <body class="overflow-hidden">

        <main class="w-full bg-primario  min-h-screen flex flex-col gap-6 justify-center items-center">

            <h2 class="text-white text-center text-2xl font-semibold max-w-[40rem] mx-auto">
                Sesión cerrada: Tu sesión ha sido actualizada en otro navegador. Por razones de seguridad, 
                la sesión anterior ya no está activa. Por favor, inicia sesión nuevamente.
            </h2>
            <img src="../img/400.jpg" class="max-w-[30rem]">
            <a href="/auth/login.jsp" class="text-center text-white hover:underline transition-all duration-500 easy-in-out font-semibold text-xl">Volver a Iniciar Sesión</a>

        </main>

    </body>
</html>
