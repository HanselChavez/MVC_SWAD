<%@page import="dao.UsuarioDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="model.Cliente,dao.ClienteDAO, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Agregar Proveedor</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>

<h1 class="text-black text-4xl font-bold">Agregar Proveedor</h1>

<h2 class="text-black text-2xl font-semibold">Datos del Proveedor</h2>
<form action="/Proveedor/add" method="post" class="max-w-[50rem] bg-transparent text-black my-6 flex gap-y-4 md:gap-y-6 flex-col xs:flex-row flex-wrap w-full">
    <!-- Datos del Proveedor -->
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4 md:pr-4">
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="empresa" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Empresa:</label>
            <input id="empresa" name="empresa" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" required>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="telefono" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Teléfono:</label>
            <input id="telefono" name="telefono" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" required>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="ruc" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">RUC:</label>
            <input id="ruc" name="ruc" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" required>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="direccion" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Dirección:</label>
            <input id="direccion" name="direccion" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" required>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="email" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Correo:</label>
            <input id="email" name="email" type="email" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" required>
        </div>
    </div>

    <!-- Datos del Contacto Inicial -->
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4">
        <h2 class="text-black text-2xl font-semibold">Contacto Inicial</h2>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="contactoNombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Nombre:</label>
            <input id="contactoNombre" name="contactoNombre" type="text" class="bg-transparent outline-none px-2 py-1 pr-4 font-sans w-full border border-secondary-300 rounded-md" required>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="contactoTelefono" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Teléfono:</label>
            <input id="contactoTelefono" name="contactoTelefono" type="text" class="bg-transparent outline-none px-2 py-1 pr-4 font-sans w-full border border-secondary-300 rounded-md" required>
        </div>
    </div>

    <!-- Botones -->
    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a href="/admin?pagina=proveedor" class="hover:bg-red-800 text-white cursor-pointer transition-all duration-500 bg-red-600 px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 cursor-pointer text-white transition-all duration-500 bg-green-600 px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Registrar</button>
    </div>
</form>
