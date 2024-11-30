
<%@page import="dao.CompraDAO"%>
<%@page import="model.Compra"%>


<%@page import="java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Compras</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    CompraDAO C = new CompraDAO();
    List<Compra> lista = new LinkedList<>();
    lista = C.getCompras();
%>


<h1 class="text-black text-4xl font-bold">Compras</h1>
<div class="my-4"> 
    <table id="tablaTransporte" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Codigo</th>
                <th>Comprador</th>
                <th>Proveedor</th>
                <th>Fecha</th>
                <th>Total</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full border-y-0">
            <%
                if (lista != null) {
                    for (Compra cm : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=cm.getId()%></td>
                <td><%= cm.getId()%></td>
                <td class="border-x border-stone-500"><%= cm.getComprador().getNombres()%> 
                    <%= cm.getComprador().getApePaterno()%> <%= cm.getComprador().getApeMaterno()%></td>
                <td><%= cm.getProveedor().getEmpresa()%>  </td>
                <td class="border-x border-stone-500"><%= cm.getFecha()%>  </td>
                <td class="border-e border-stone-500"><%= cm.getTotal()%></td>
                <td class="text-xl  flex justify-center items-center gap-2 "             
                    data-id="<%= cm.getId()%>"
                    data-empleado="<%= cm.getComprador().getId()%>"
                    data-fecha ="<%= cm.getFecha()%>"
                    data-total="<%= cm.getTotal()%>">
                    <i class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       onclick="editUser(this.parentElement)"></i>
                    <i onclick="detailsUser(this.parentElement)" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></i>
                    <i onclick="deleteUser(this.parentElement)" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></i>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

<button onclick="showModalCreate()" class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
        px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Compra
</button>
<div id="modalCreate" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[65rem] relative">
        <i onclick="closeModalCreate()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl">Agregar Usuario</h2>
        <form action="/Users/add" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cdni" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Dni:</label>
                    <input id="cdni" name="dni" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cnombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre:</label>
                    <input id="cnombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="capePaterno" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Apellido Paterno:</label>
                    <input id="capePaterno" name="apePaterno" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="capeMaterno" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Apellido Materno:</label>
                    <input id="capeMaterno" name="apeMaterno" type="text" class="bg-secondary-800 outline-none 
                           font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="cfecha" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Fecha Nacimiento:</label>
                    <input id="cfecha" name="fecha" type="date" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="ccorreo" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Correo:</label>
                    <input id="ccorreo" name="correo" type="email" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between  xs:items-center  w-full">
                    <label for="cpassword" class="text-lg font-medium   xs:w-2/4 sm:w-2/5">Contraseña:</label>
                    <input id="cpassword" name="password" type="password"  autocomplete="current-password"
                           class="bg-secondary-800 outline-none  px-2 py-1 font-sans w-full border 
                           border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="cusername" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Username:</label>
                    <input id="cusername" name="username" autocomplete="false" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " >
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="ctelefono"class="text-lg font-medium   xs:w-2/4 sm:w-2/5">Telefono:</label>
                    <input id="ctelefono" name="telefono" type="tel" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
                <button onclick="closeModalCreate()" type="button" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</button>
                <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                        px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Registrar</button>
            </div>
        </form>
    </div>
</div>

<div id="modalEdit" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[65rem] relative">
        <i onclick="closeModalEdit()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl">Editar Usuario</h2>
        <form action="/Users/edit" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <input id="eid" name="id" type="text" hidden="true">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="edni" class="sm:text-lg font-medium   xs:w-2/4 sm:w-2/5 md:w-2/4">Dni:</label>
                    <input id="edni" name="dni" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="enombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre:</label>
                    <input id="enombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="eapePaterno" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Apellido Paterno:</label>
                    <input id="eapePaterno" name="apePaterno" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="eapeMaterno" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Apellido Materno:</label>
                    <input id="eapeMaterno" name="apeMaterno" type="text" class="bg-secondary-800 outline-none 
                           font-sans px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="efecha" class="sm:text-lg font-medium  xs:w-2/4 sm:w-2/5 md:w-2/4">Fecha Nacimiento:</label>
                    <input id="efecha" name="fecha" type="date" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4  ">
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="ecorreo" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Correo:</label>
                    <input id="ecorreo" name="correo" type="email" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md" autocomplete="false" value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between  xs:items-center  w-full">
                    <label for="epassword" class="text-lg font-medium   xs:w-2/4 sm:w-2/5">Contraseña:</label>
                    <input id="epassword" name="password" type="password" 
                           class="bg-secondary-800 outline-none  px-2 py-1 font-sans w-full border 
                           border-secondary-300 rounded-md" autocomplete="false" value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <label for="eusername" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5">Username:</label>
                    <input id="eusername" name="username" autocomplete="false" type="tel" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " >
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="etelefono"class="text-lg font-medium   xs:w-2/4 sm:w-2/5">Telefono:</label>
                    <input id="etelefono" name="telefono" type="tel" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
                <button onclick="closeModalEdit()" type="button" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</button>
                <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                        px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Guardar Cambios</button>
            </div>
        </form>
    </div>
</div>
<div id="modalDelete" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[25rem] relative">
        <i onclick="closeModalDelete()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        </svg>
        <h2 class="font-bold text-2xl text-center">Eliminar Usuario</h2>
        <form action="/Users/delete" method="post" class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <p class="text-xl font-semibold text-center">¿Estas seguro de eliminar este registro?</p>
            <input id="did" name="id" type="text" hidden>
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Dni:
                    </dt>
                    <dd class="text-end text-left" id="ddni">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Nombre:
                    </dt>
                    <dd class="text-end text-left" id="dnombre">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apellido Paterno:
                    </dt>
                    <dd class="text-end text-left" id="dapePaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apellido Materno:
                    </dt>
                    <dd class="text-end text-left" id="dapeMaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Fecha Nacimiento:
                    </dt>
                    <dd class="text-end text-left" id="dfecha">    
                    </dd>
                </div>

                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Correo:
                    </dt>
                    <dd class="text-end text-left" id="dcorreo">    
                    </dd>
                </div>

                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Username:                   
                    </dt>
                    <dd class="text-end text-left" id="dusername">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Telefono:
                    </dt>
                    <dd class="text-end text-left" id="dtelefono">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Rol:
                    </dt>
                    <dd class="text-end text-left" id="drol">    
                    </dd>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-between">
                <button onclick="closeModalDelete()" type="button" class="hover:bg-red-800 cursor-pointer transition-all duration-500 bg-red-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</button>
                <button type="submit" class="hover:bg-green-800 cursor-pointer transition-all duration-500 bg-green-600 
                        px-5 justify-center  py-1 rounded-md font-medium text-lg flex gap-2 items-center">Eliminar</button>
            </div>
        </form>
    </div>
</div>
<div id="modalDetails" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[25rem] relative">
        <i onclick="closeModalDetails()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl text-center">Detalles Usuario</h2>
        <div  class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Dni:
                    </dt>
                    <dd class="text-end text-left" id="dddni">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Nombre:
                    </dt>
                    <dd class="text-end text-left" id="ddnombre">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apellido Paterno:
                    </dt>
                    <dd class="text-end text-left" id="ddapePaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Apellido Materno:
                    </dt>
                    <dd class="text-end text-left" id="ddapeMaterno">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Fecha Nacimiento:
                    </dt>
                    <dd class="text-end text-left" id="ddfecha">    
                    </dd>
                </div>

                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Correo:
                    </dt>
                    <dd class="text-end text-left" id="ddcorreo">    
                    </dd>
                </div>

                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Username:                   
                    </dt>
                    <dd class="text-end text-left" id="ddusername">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Telefono:
                    </dt>
                    <dd class="text-end text-left" id="ddtelefono">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Rol:
                    </dt>
                    <dd class="text-end text-left" id="ddrol">    
                    </dd>
                </div>
            </div>
            <div class="flex flex-col xs:flex-row w-full gap-4 justify-between">
                <button onclick="closeModalDetails()" type="button" class="hover:bg-blue-800 cursor-pointer transition-all duration-500 bg-blue-600 
                        px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Volver</button>

            </div>
        </div>
    </div>
</div>
<script>
    const editUser = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const dni = element.getAttribute('data-dni') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const fechaNac = element.getAttribute('data-fecha') || '';
        const apellidoPat = element.getAttribute('data-apellido-pat') || '';
        const apellidoMat = element.getAttribute('data-apellido-mat') || '';
        const correo = element.getAttribute('data-correo') || '';
        const username = element.getAttribute('data-username') || '';
        const pass = element.getAttribute('data-pass') || '';
        const telefono = element.getAttribute('data-telefono') || '';
        const rol = element.getAttribute('data-rol') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('edni').value = dni;
        console.log(fechaNac)
        document.getElementById('eid').value = id;
        document.getElementById('enombre').value = nombre;
        document.getElementById('eapeMaterno').value = apellidoMat;
        document.getElementById('eapePaterno').value = apellidoPat;
        document.getElementById('eusername').value = username;
        document.getElementById('etelefono').value = telefono;
        document.getElementById('efecha').value = fechaNac;
        document.getElementById('epassword').value = pass;
        document.getElementById('erol').value = Number(rol);
        document.getElementById('ecorreo').value = correo;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
    };
    const deleteUser = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const dni = element.getAttribute('data-dni') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const fechaNac = element.getAttribute('data-fecha') || '';
        const apellidoPat = element.getAttribute('data-apellido-pat') || '';
        const apellidoMat = element.getAttribute('data-apellido-mat') || '';
        const correo = element.getAttribute('data-correo') || '';
        const username = element.getAttribute('data-username') || '';
        const telefono = element.getAttribute('data-telefono') || '';
        const rol = element.getAttribute('data-rolNombre') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('ddni').textContent = dni;
        document.getElementById('did').value = id;
        document.getElementById('dnombre').textContent = nombre;
        document.getElementById('dapeMaterno').textContent = apellidoMat;
        document.getElementById('dapePaterno').textContent = apellidoPat;
        document.getElementById('dusername').textContent = username;
        document.getElementById('dtelefono').textContent = telefono;
        document.getElementById('dfecha').textContent = fechaNac;
        document.getElementById('drol').textContent = rol;
        document.getElementById('dcorreo').textContent = correo;
        document.getElementById('dtelefono').textContent = telefono;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalDelete');
        modal.classList.remove('hidden');
    };
    const detailsUser = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const dni = element.getAttribute('data-dni') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const fechaNac = element.getAttribute('data-fecha') || '';
        const apellidoPat = element.getAttribute('data-apellido-pat') || '';
        const apellidoMat = element.getAttribute('data-apellido-mat') || '';
        const correo = element.getAttribute('data-correo') || '';
        const username = element.getAttribute('data-username') || '';
        const telefono = element.getAttribute('data-telefono') || '';
        const rol = element.getAttribute('data-rolNombre') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('dddni').textContent = dni;
        document.getElementById('ddnombre').textContent = nombre;
        document.getElementById('ddapeMaterno').textContent = apellidoMat;
        document.getElementById('ddapePaterno').textContent = apellidoPat;
        document.getElementById('ddusername').textContent = username;
        document.getElementById('ddtelefono').textContent = telefono;
        document.getElementById('ddfecha').textContent = fechaNac;
        document.getElementById('ddrol').textContent = rol;
        document.getElementById('ddcorreo').textContent = correo;
        document.getElementById('ddtelefono').textContent = telefono;
        //Asegúrate de ajustar los demás campos según sea necesario
        // Muestra el modal de edición
        const modal = document.getElementById('modalDetails');
        modal.classList.remove('hidden');
    };
    const closeModalDetails = () => {
        limpiarModalDetails();
        const modal = document.getElementById('modalDetails');
        modal.classList.add('hidden');
    };
    const closeModalDelete = () => {
        limpiarModalDelete();
        const modal = document.getElementById('modalDelete');
        modal.classList.add('hidden');
    };
    const closeModalEdit = () => {
        limpiarModalEdit();
        const modal = document.getElementById('modalEdit');
        modal.classList.add('hidden');
    };
    const showModalCreate = () => {
        limpiarModalCreate();
        const modal = document.getElementById('modalCreate');
        modal.classList.remove('hidden');
    };
    const closeModalCreate = () => {
        const modal = document.getElementById('modalCreate');
        modal.classList.add('hidden');
        limpiarModalCreate();
    };
    const limpiarModalDetails = () => {
        document.getElementById('dddni').textContent = '';
        document.getElementById('ddnombre').textContent = '';
        document.getElementById('ddapeMaterno').textContent = '';
        document.getElementById('ddapePaterno').textContent = '';
        document.getElementById('ddusername').textContent = '';
        document.getElementById('ddtelefono').textContent = '';
        document.getElementById('ddfecha').textContent = '';
        document.getElementById('ddrol').textContent = '';
        document.getElementById('ddcorreo').textContent = '';
        document.getElementById('ddtelefono').textContent = '';
    };
    const limpiarModalDelete = () => {
        document.getElementById('ddni').textContent = '';
        document.getElementById('did').value = '';
        document.getElementById('dnombre').textContent = '';
        document.getElementById('dapeMaterno').textContent = '';
        document.getElementById('dapePaterno').textContent = '';
        document.getElementById('dusername').textContent = '';
        document.getElementById('dtelefono').textContent = '';
        document.getElementById('dfecha').textContent = '';
        document.getElementById('drol').textContent = '';
        document.getElementById('dcorreo').textContent = '';
        document.getElementById('dtelefono').textContent = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('cdni').value = '';
        document.getElementById('cnombre').value = '';
        document.getElementById('capePaterno').value = '';
        document.getElementById('capeMaterno').value = '';
        document.getElementById('ccorreo').value = '';
        document.getElementById('cpassword').value = '';
        document.getElementById('cfecha').value = '';
        document.getElementById('cusername').value = '';
        document.getElementById('ctelefono').value = '';
        document.getElementById('crol').selectedIndex = 0;
    };
    const limpiarModalEdit = () => {
        document.getElementById('edni').value = '';
        document.getElementById('eid').value = '';
        document.getElementById('enombre').value = '';
        document.getElementById('eapePaterno').value = '';
        document.getElementById('eapeMaterno').value = '';
        document.getElementById('ecorreo').value = '';
        document.getElementById('efecha').value = '';
        document.getElementById('eusername').value = '';
        document.getElementById('etelefono').value = '';
        document.getElementById('epassword').value = '';
        document.getElementById('erol').selectedIndex = 0;
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaTransporte').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 5]},
                {orderable: false, targets: [1, 5]},
                {searchable: false, targets: [0]},
                {width: "10%", targets: [1]},
                {width: "25%", targets: [2,3]}

            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ninguna compra encontrada",
                infoEmpty: "No hay registros disponibles",
                infoFiltered: "(filtrando desde _MAX_ registros totales)",
                info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros."
            }

        });
        // Crea un nuevo div
        const div = document.createElement('DIV');
        // div.classList.add('overflow-auto');
        div.classList.add('snap-none');
        div.classList.add('scroll-p-0');
        div.classList.add('w-full');
        div.classList.add('rounded-md');
        div.classList.add('tabla-citas');
        div.id = 'newParentDiv';
        // Obtén la tabla original
        const table = document.getElementById('tablaTransporte');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>