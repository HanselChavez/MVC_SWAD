<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="dao.ProveedorDAO"%>
<%@page import="model.Proveedor, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Proveedores</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

</head>
<%
    ProveedorDAO C = new ProveedorDAO();
    List<Proveedor> lista = new LinkedList<>();
    lista = C.getProveedores();
%>


<h1 class="text-black text-4xl font-bold">Proveedores</h1>
<div class="my-4"> 
    <table id="tablaProveedor" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">Id</th>
                <th>RUC</th>
                <th>Razon Social</th>
                <th>Direccion</th>
                <th>Telefono</th>
                <th>Email</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full">
            <%
                if (lista != null) {
                    for (Proveedor prov : lista) {

            %>
            <tr class="bg-neutral-3000 text-center py-2  border-stone-500 border-y">                <td class="hidden"><%=prov.getId()%></td>
                <td><%= prov.getRuc()%></td>
                <td class="border-x border-stone-500"><%= prov.getEmpresa()%></td>
                <td><%= prov.getDireccion()%>
                <td class="border-x border-stone-500"><%= prov.getTelefono()%></td>
                <td  class="border-e border-stone-500"><%= prov.getCorreo()%></td>
                <td class="text-xl flex justify-center items-center gap-2">
                    <a class="cursor-pointer text-green-700 hover:text-green-500 transition-all duration-500 fa-solid fa-pen-to-square"
                       href="/admin?pagina=proveedor&accion=edit&id=<%= prov.getId()%>"></a>
                    <a href="/admin?pagina=proveedor&accion=details&id=<%= prov.getId()%>" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></a>
                    <a href="/admin?pagina=proveedor&accion=delete&id=<%= prov.getId()%>" class="cursor-pointer text-red-700 hover:text-red-500 transition-all duration-500 fa-solid fa-trash"></a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

<a href="/admin?pagina=proveedor&accion=add"  class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
   px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Producto
</a>

<script>
    const editProveedor = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const empresa = element.getAttribute('data-empresa') || '';
        const encargado = element.getAttribute('data-encargado') || '';
        const ruc = element.getAttribute('data-ruc') || '';
        const direc = element.getAttribute('data-direc') || '';
        const email = element.getAttribute('data-email') || '';


        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('eid').value = id;
        document.getElementById('erazon').value = empresa;
        document.getElementById('eencargado').value = encargado;
        document.getElementById('eruc').value = ruc;
        document.getElementById('edirec').value = direc;
        document.getElementById('ecorreo').value = email;

        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalEdit');
        modal.classList.remove('hidden');
    };
    const deleteProveedor = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const id = element.getAttribute('data-id') || '';
        const empresa = element.getAttribute('data-empresa') || '';
        const encargado = element.getAttribute('data-encargado') || '';
        const ruc = element.getAttribute('data-ruc') || '';
        const direc = element.getAttribute('data-direc') || '';
        const email = element.getAttribute('data-email') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('did').value = id;
        document.getElementById('drazon').textContent = empresa;
        document.getElementById('dencargado').textContent = encargado;
        document.getElementById('druc').textContent = ruc;
        document.getElementById('ddirec').textContent = direc;
        document.getElementById('demail').textContent = email;
        //Asegúrate de ajustar los demás campos según sea necesario

        // Muestra el modal de edición
        const modal = document.getElementById('modalDelete');
        modal.classList.remove('hidden');
    };
    const detailsProveedor = element => {
        console.log(element);
        // Extrae los datos del usuario del elemento
        const empresa = element.getAttribute('data-empresa') || '';
        const encargado = element.getAttribute('data-encargado') || '';
        const ruc = element.getAttribute('data-ruc') || '';
        const direc = element.getAttribute('data-direc') || '';
        const email = element.getAttribute('data-email') || '';

        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('ddrazon').textContent = empresa;
        document.getElementById('ddencargado').textContent = encargado;
        document.getElementById('ddruc').textContent = ruc;
        document.getElementById('dddirec').textContent = direc;
        document.getElementById('ddemail').textContent = email;
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
        document.getElementById('ddrazon').value = '';
        document.getElementById('ddencargado').value = '';
        document.getElementById('ddruc').value = '';
        document.getElementById('dddirec').value = '';
        document.getElementById('ddemail').value = '';
    };
    const limpiarModalDelete = () => {
        document.getElementById('drazon').value = '';
        document.getElementById('dencargado').value = '';
        document.getElementById('druc').value = '';
        document.getElementById('ddirec').value = '';
        document.getElementById('demail').value = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('crazon').value = '';
        document.getElementById('cencargado').value = '';
        document.getElementById('cruc').value = '';
        document.getElementById('cdirec').value = '';
        document.getElementById('cemail').value = '';
    };
    const limpiarModalEdit = () => {
        document.getElementById('erazon').value = '';
        document.getElementById('eencargado').value = '';
        document.getElementById('eruc').value = '';
        document.getElementById('edirec').value = '';
        document.getElementById('ecorreo').value = '';
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaProveedor').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [1, 5]},
                {className: "text-left", targets: [2, 3, 4]},
                {orderable: false, targets: [1, 6]},
                {searchable: false, targets: [2, 6]},
                {width: "12%", targets: [1, 4, 6]},
                {width: "24%", targets: [3, 2]}

            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun proveedor encontrado",
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
        const table = document.getElementById('tablaProveedor');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>