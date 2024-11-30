<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="dao.RolDAO"%>
<%@page import="model.Rol, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Roles</title>        
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
        <!-- Incluir jQuery -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <!-- Incluir DataTables JS desde CDN -->
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    RolDAO C = new RolDAO();
    List<Rol> lista = new LinkedList<>();
    lista = C.getRols();
%>


<h1 class="text-white text-4xl font-bold">Roles</h1>
<div class="my-4"> 
    <table id="tablaRoles" class="min-w-[70rem] w-full ml-0 bg-secondary-800 rounded-md">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full">
            <%
                if (lista != null) {
                    for (Rol rol : lista) {

            %>
            <tr class="bg-secondary-800 text-gray-300 text-center py-2 border-t border-t-secondary-300">
                <td class="hidden"><%=rol.getId()%></td>
                <td><%= rol.getNombre()%></td>
                <td><%= rol.getDescripcion()%></td>           
                <td class="text-xl flex justify-center items-center gap-2 "             
                    data-id="<%= rol.getId()%>"
                    data-nombre="<%= rol.getNombre()%>"
                    data-descripcion="<%= rol.getDescripcion()%>">
                    <i class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       onclick="editRol(this.parentElement)"></i>
                    <i onclick="detailsRol(this.parentElement)" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></i>
                    <i onclick="deleteRol(this.parentElement)" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></i>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

<button onclick="showModalCreate()" class="hover:bg-contrast-800 text-white cursor-pointer transition-all duration-500 bg-contrast-600 px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 448 512" 
         height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
        <path d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 
              32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 
              17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 
              32-32v-32c0-17.67-14.33-32-32-32z">                  
        </path>
    </svg> Nuevo Rol
</button>
<div id="modalCreate" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[30rem] relative">
        <i onclick="closeModalCreate()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        </svg>
        <h2 class="font-bold text-2xl">Agregar Rol</h2>
        <form action="/Rols/add" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">

            <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                <label for="cnombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre:</label>
                <input id="cnombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                       px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
            </div>
            <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-start w-full">
                <label for="cdescripcion" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Descripción:</label>
                <textarea id="cdescripcion" name="descripcion" class="bg-secondary-800 outline-none font-sans 
                          px-2 py-1 w-full border border-secondary-300 rounded-md" rows="4"></textarea>
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
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[30rem] relative">
        <i onclick="closeModalEdit()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        </svg>
        <h2 class="font-bold text-2xl">Editar Rol</h2>
        <form action="/Rols/edit" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <input id="eid" name="id" type="text" hidden="true">             
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="enombre" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Nombre:</label>
                    <input id="enombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-start w-full">
                    <label for="edescripcion" class="sm:text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/4">Descripción:</label>
                    <textarea id="edescripcion" name="descripcion" class="bg-secondary-800 outline-none font-sans 
                              px-2 py-1 w-full border border-secondary-300 rounded-md" rows="4"></textarea>
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
        <h2 class="font-bold text-2xl text-center">Eliminar Rol</h2>
        <form action="/Rols/delete" method="post" class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <p class="text-xl font-semibold text-center">¿Estas seguro de eliminar este registro?</p>
            <input id="did" name="id" type="text" hidden="true">
                <div class="flex flex-col gap-y-2  w-full  ">               
                    <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                        <dt class="font-medium">
                            Nombre:
                        </dt>
                        <dd class="text-end text-left" id="dnombre">    
                        </dd>
                    </div>
                    <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                        <dt class="font-medium">
                            Descripcion
                        </dt>
                        <dd class="text-end text-left" id="ddescripcion">    
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
        </svg>
        <h2 class="font-bold text-2xl text-center">Detalles de Rol</h2>
        <div  class="text-white my-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Nombre:
                    </dt>
                    <dd class="text-end text-left" id="ddnombre">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Descripcion
                    </dt>
                    <dd class="text-end text-left" id="dddescripcion">    
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
    const editRol = element => {
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const descripcion = element.getAttribute('data-descripcion') || '';

        document.getElementById('eid').value = id;
        document.getElementById('enombre').value = nombre;
        document.getElementById('edescripcion').value = descripcion;

        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
    };
    const deleteRol = element => {
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const descripcion = element.getAttribute('data-descripcion') || '';

        document.getElementById('did').value = id;
        document.getElementById('dnombre').textContent = nombre;
        document.getElementById('ddescripcion').textContent = descripcion;

        const modal = document.getElementById('modalDelete');
        modal.classList.remove('hidden');
    };
    const detailsRol = element => {
        const nombre = element.getAttribute('data-nombre') || '';
        const descripcion = element.getAttribute('data-descripcion') || '';

        document.getElementById('ddnombre').textContent = nombre;
        document.getElementById('dddescripcion').textContent = descripcion;

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
        document.getElementById('ddnombre').textContent = '';
        document.getElementById('dddescripcion').textContent = '';
    };
    const limpiarModalDelete = () => {
        document.getElementById('eid').value = '';
        document.getElementById('dnombre').textContent = '';
        document.getElementById('ddescripcion').textContent = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('cnombre').value = '';
        document.getElementById('cdescripcion').value = '';
    };
    const limpiarModalEdit = () => {
        document.getElementById('eid').value = '';
        document.getElementById('enombre').value = '';
        document.getElementById('edescripcion').value = '';
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaRoles').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 3]},
                {className: "text-left", targets: [2]},
                {orderable: false, targets: [0, 2, 3]},
                {searchable: false, targets: [0, 2, 3]},
                {width: "20%", targets: [1, 3]}
            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun rol encontrado",
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
        const table = document.getElementById('tablaRoles');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>