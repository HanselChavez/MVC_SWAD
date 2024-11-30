<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>
<%@page import="dao.ClienteDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="model.Cliente, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Clientes</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ClienteDAO C = new ClienteDAO();
    List<Cliente> lista = new LinkedList<>();
    lista = C.getClientes();
%>


<h1 class="text-black text-4xl font-bold">Clientes</h1>

<div class="my-4"> 
    <table id="tablaCliente" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>DNI</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full">
            <%
                if (lista != null) {
                    for (Cliente cl : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=cl.getId()%></td>
                <td><%= cl.getNombre()%></td>
                <td class="border-x border-stone-500"><%= cl.getApellPaterno()%> <%= cl.getApellMaterno()%></td>
                <td><%= cl.getTelefono()%></td>
                <td class="border-x border-stone-500"><%= cl.getCorreo()%></td>
                <td class="border-e border-stone-500"><%= cl.getDni()%></td>
                <td class="text-xl  flex justify-center items-center gap-2 "             
                    data-id="<%= cl.getId()%>"
                    data-nombre="<%= cl.getNombre()%>"
                    data-apPaterno="<%= cl.getApellPaterno()%>"
                    data-apMaterno="<%= cl.getApellMaterno()%>"
                    data-telf="<%= cl.getTelefono()%>"
                    data-correo="<%= cl.getCorreo()%>"
                    data-dni="<%= cl.getDni()%>">
                    <i onclick="detailsCliente(this.parentElement)" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></i>
                    <!-- <i onclick="deleteCliente(this.parentElement)" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></i> -->
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>
<a href="/vendedor?pagina=client&accion=add"  class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
   px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Cliente
</a>

        
<script>
    const editCliente = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const paterno = element.getAttribute('data-apPaterno') || '';
        const materno = element.getAttribute('data-apMaterno') || '';
        const telf = element.getAttribute('data-telf') || '';
        const direc = element.getAttribute('data-direc') || '';
        const dni = element.getAttribute('data-dni') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('eid').value = id;
        document.getElementById('enombre').value = nombre;
        document.getElementById('epaterno').value = paterno;
        document.getElementById('ematerno').value = materno;
        document.getElementById('etelf').value = telf;
        document.getElementById('edirec').value = direc;
        document.getElementById('edni').value = dni;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
    };
    const deleteCliente = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const paterno = element.getAttribute('data-apPaterno') || '';
        const materno = element.getAttribute('data-apMaterno') || '';
        const telf = element.getAttribute('data-telf') || '';
        const direc = element.getAttribute('data-direc') || '';
        const dni = element.getAttribute('data-dni') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('did').value = id;
        document.getElementById('dnombre').textContent = nombre;
        document.getElementById('dpaterno').textContent = paterno;
        document.getElementById('dmaterno').textContent = materno;
        document.getElementById('dtelf').textContent = telf;
        document.getElementById('ddirec').textContent = direc;
        document.getElementById('ddni').textContent = dni;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalDelete');
        modal.classList.remove('hidden');
    };
    const detailsCliente = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const paterno = element.getAttribute('data-apPaterno') || '';
        const materno = element.getAttribute('data-apMaterno') || '';
        const telf = element.getAttribute('data-telf') || '';
        const direc = element.getAttribute('data-direc') || '';
        const dni = element.getAttribute('data-dni') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('ddnombre').textContent = nombre;
        document.getElementById('ddpaterno').textContent = paterno;
        document.getElementById('ddmaterno').textContent = materno;
        document.getElementById('ddtelf').textContent = telf;
        document.getElementById('dddirec').textContent = direc;
        document.getElementById('dddni').textContent = dni;
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
        document.getElementById('ddnombre').value = '';
        document.getElementById('ddpaterno').value = '';
        document.getElementById('ddmaterno').value = '';
        document.getElementById('ddtelf').value = '';
        document.getElementById('dddirec').value = '';
        document.getElementById('dddni').value = '';
    };
    const limpiarModalDelete = () => {
        document.getElementById('did').value = '';
        document.getElementById('dnombre').value = '';
        document.getElementById('dpaterno').value = '';
        document.getElementById('dmaterno').value = '';
        document.getElementById('dtelf').value = '';
        document.getElementById('ddirec').value = '';
        document.getElementById('ddni').value = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('cnombre').value = '';
        document.getElementById('cpaterno').value = '';
        document.getElementById('cmaterno').value = '';
        document.getElementById('ctelf').value = '';
        document.getElementById('cdirec').value = '';
        document.getElementById('cdni').value = '';
    };
    const limpiarModalEdit = () => {
        document.getElementById('enombre').value = '';
        document.getElementById('epaterno').value = '';
        document.getElementById('ematerno').value = '';
        document.getElementById('etelf').value = '';
        document.getElementById('edirec').value = '';
        document.getElementById('edni').value = '';
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaCliente').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 3, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [5, 3, 4, 6]},
                {searchable: false, targets: [0, 6]},
                {width: "18%", targets: [2, 5]},
                {width: "14%", targets: [1, 3]},
                {width: "25%", targets: [4]}


            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun cliente encontrado",
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
        const table = document.getElementById('tablaCliente');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>