<%-- 
    Document   : delete
    Created on : 16 nov. 2024, 12:20:17
    Author     : Usuario
--%>

<%@page import="model.Proveedor"%>
<%@page import="dao.ProveedorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        ProveedorDAO PV = new ProveedorDAO();
        String idParam = request.getParameter("id");
        Proveedor proveedor = PV.getProveedorById(idParam);
    %>

    <h1 class="text-black text-4xl font-bold">Eliminar Proveedor</h1>

    <form action="/Proveedor/delete" method="post" class="text-black my-6 flex gap-y-4 max-w-[70rem] md:gap-y-6 flex-col xs:flex-row flex-wrap w-full">
        <input id="eid" name="id" type="text" hidden="true" value="<%= proveedor.getId()%>">

        <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4 md:pr-4">
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="empresa" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Empresa:</label>
                <div id="empresa" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getEmpresa() %>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="telefono" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Teléfono:</label>
                <div id="telefono" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getTelefono() %>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="ruc" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">RUC:</label>
                <div id="ruc" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getRuc() %>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="direccion" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Dirección:</label>
                <div id="direccion" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getDireccion() %>
                </div>
            </div>
        </div>

        <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4">
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="email" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Correo:</label>
                <div id="email" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getCorreo() %>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="contactoNombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Contacto:</label>
                <div id="contacto" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getContactoInicial().getNombre() %>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
                <label for="contactoTelefono" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Telefono</label>
                <div id="telefonoContacto" class="bg-transparent font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                    <%= proveedor.getContactoInicial().getTelefono() %>
                </div>
            </div>
        </div>

        <div class="flex text-white flex-col xs:flex-row w-full gap-4 justify-evenly">
            <a href="/admin?pagina=proveedor" class="hover:bg-blue-800 cursor-pointer transition-all duration-500 bg-blue-600 px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
            <button type="submit" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Eliminar</button>
        </div>
    </form>
</body>
</html>
