<%@page import="dao.EstadoProductoDAO"%>
<%@page import="dao.ProveedorDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.EstadoProducto"%>
<%@page import="model.Proveedor"%>
<%@page import="model.Categoria"%>
<%@page import="model.Producto, java.util.List, java.util.LinkedList" %>
<head>
    <script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Productos</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <style>
        .error-input {
            border-color: #FF5733;
        }
    </style>
</head>
<%
    ProductoDAO C = new ProductoDAO();
    List<Producto> lista = new LinkedList<>();
    lista = C.getProducts();
    CategoriaDAO CT = new CategoriaDAO();
    List<Categoria> categorias = new LinkedList<>();
    categorias = CT.getCategories();
    ProveedorDAO P = new ProveedorDAO();
    List<Proveedor> proveedores = new LinkedList<>();
    proveedores = P.getProveedores();
    EstadoProductoDAO EP = new EstadoProductoDAO();
    List<EstadoProducto> estados = new LinkedList<>();
    estados = EP.getEstados();
%>


<h1 class="text-4xl font-bold text-black">Productos</h1>
<div class="my-4"> 
    <table id="tablaProducto" class="min-w-[70rem] border-0 w-full ml-0 bg-secondary-800 ">
        <thead  class="w-full">
            <tr class="text-white">
                <th class="hidden">ID</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Categoría</th>
                <th>Proveedor</th>
                <th>Prec. Compra</th>
                <th>Prec. Venta</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody class="min-w-full border-y-0">
            <%
                if (lista != null) {
                    for (Producto prd : lista) {

            %>
            <tr class="bg-neutral-3000  text-center py-2  border-stone-500 border-y">
                <td class="hidden"><%=prd.getId()%></td>
                <td><%= prd.getNombre()%></td>
                <td class="border-x border-stone-500"><%= prd.getDescripcion()%></td>
                <td><%= prd.getCategoria().getNombre()%></td>
                <td class="border-x border-stone-500"><%= prd.getProveedor().getEmpresa()%></td>
                <td>S/ <%= prd.getPrecioCompra()%></td>
                <td class="border-x border-stone-500">S/ <%= prd.getPrecioVenta()%></td>
                <td class="text-xl flex justify-center items-center gap-2">
                     <a href="/vendedor?pagina=productos&accion=details&id=<%= prd.getId()%>" class="cursor-pointer text-blue-700 hover:text-blue-500 transition-all duration-500 fa-solid fa-circle-info"></a>
                </td>
                
                    
                   
                
            </tr>
            <%
                    }
                }
            %>
        </tbody>  
    </table>  
</div>

        <!-- 
<button onclick="showModalCreate()" class="mt-4 hover:bg-primario-400 text-white cursor-pointer transition-all duration-500 bg-primario-800 
        px-5 justify-center py-1 rounded-md font-medium text-xl flex gap-2 items-center max-w-60">
    Nuevo Producto !-->
</button> 
<div id="modalCreate" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[65rem] relative">
        <i onclick="closeModalCreate()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl">Agregar Producto</h2>
        <form id="productForm" action="/Producto/add" method="post" class="text-white my-6 flex gap-y-4  md:gap-y-6 flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full">
                    <label for="cnombre" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Nombre</label>
                    <input id="cnombre" name="nombre" type="text" class="bg-secondary-800 outline-none font-sans 
                           px-2 py-1 w-full border border-secondary-300 rounded-md " value="">
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cdescrip" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Descripcion</label>
                    <textarea id="cdescrip" name="descripcion" class="bg-secondary-800 outline-none 
                              font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" rows="3"></textarea>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cestado" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Estado</label>
                    <select name="estado" id="cestado" class="bg-secondary-800 outline-none 
                            font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                        <%
                            if (lista != null && estados != null) {
                                for (EstadoProducto ep : estados) {

                        %>
                        <option value="<%=ep.getId()%>" ><%=ep.getNombre()%> </ </option>
                        <%                                }
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="flex flex-col gap-y-4 md:gap-y-6 w-full  md:w-2/4 md:pr-4 ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="ccateg" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Categoria</label>
                    <select name="categoria" id="ccateg" class="bg-secondary-800 outline-none 
                            font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                        <%
                            if (lista != null && categorias != null) {
                                for (Categoria ct : categorias) {

                        %>
                        <option value="<%=ct.getId()%>" ><%=ct.getNombre()%> </ </option>
                        <%                                }
                            }
                        %>
                    </select>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full  ">
                    <label for="cprov" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Proveedor</label>
                    <select name="proveedor" id="cprov" class="bg-secondary-800 outline-none 
                            font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                        <%
                            if (lista != null && proveedores != null) {
                                for (Proveedor p : proveedores) {

                        %>
                        <option value="<%=p.getId()%>" ><%=p.getEmpresa()%> </ </option>
                        <%                                }
                            }
                        %>
                    </select>
                </div>

                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full">
                    <label for="ccompra" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Prec. Compra</label>
                    <input id="ccompra" name="pcompra" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
                </div> 
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full">
                    <label for="cventa" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Prec. Venta</label>
                    <input id="cventa" name="pventa" type="text" class="bg-secondary-800 outline-none 
                           px-2 py-1 pr-4 font-sans w-full border  border-secondary-300 rounded-md " value="">
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
<div id="modalDetails" class="hidden overlay w-full bg-black-50 h-full min-h-screen bottom-0 absolute right-0 flex items-center justify-center">
    <div class="modal bg-secondary-800 p-4 md:p-6 rounded-md text-white w-[95%] max-w-[25rem] relative">
        <i onclick="closeModalDetails()" class="fa-solid fa-xmark text-white text-2xl cursor-pointer hover:text-contrast-600 transition-all 
           duration-500 right-3 top-3 absolute"></i>
        <h2 class="font-bold text-2xl text-center">Detalles Producto</h2>
        <div  class="text-white mt-6 flex gap-y-4  flex-col xs:flex-row  flex-wrap w-full">
            <div class="flex flex-col gap-y-2  w-full  ">
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium">
                        Nombre:
                    </dt>
                    <dd class="text-end text-left" id="ddnombre">    
                    </dd>
                </div><div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <dt class="font-medium w-1/4">
                        Descripción:
                    </dt>
                    <dd class="text-end text-left w-3/4" id="dddescrip">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center  w-full ">
                    <dt class="font-medium w-1/4">
                        Categoría:
                    </dt>
                    <dd class="text-end text-left w-3/4" id="ddcateg">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium w-1/4">
                        Proveedor:
                    </dt>
                    <dd class="text-end text-left w-3/4" id="ddprov">    
                    </dd>
                </div>      
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium w-1/4">
                        Estado
                    </dt>
                    <dd class="text-end text-left w-3/4" id="ddestado">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium w-1/4">
                        P.Compra:
                    </dt>
                    <dd class="text-end text-left w-3/4" id="ddcompra">    
                    </dd>
                </div>
                <div class="flex flex-col xs:flex-row gap-0.5  justify-between xs:items-center  w-full ">
                    <dt class="font-medium w-1/4">
                        P.Venta:
                    </dt>
                    <dd class="text-end text-left w-3/4" id="ddventa">    
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

    document.getElementById('productForm').addEventListener('submit', function (e) {
        e.preventDefault();
        let valid = true;
        let toastDisplayed = false;

        const nombre = document.getElementById('cnombre');
        if (nombre.value.trim().length < 8) {
            nombre.classList.add('border-red-600');
            valid = false;
            if (!toastDisplayed) {
                Toastify({
                    text: "El nombre del producto debe tener al menos 8 caracteres.",
                    duration: 1500,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#FF5733"
                }).showToast();
                toastDisplayed = true;
            }
        } else {
            nombre.classList.remove('border-red-600');
        }

        const fields = ['cdescrip', 'cestado', 'ccateg', 'cprov', 'ccompra', 'cventa'];
        fields.forEach(id => {
            const field = document.getElementById(id);
            if (field.value.trim() === "") {
                field.classList.add('border-red-600');
                valid = false;
                if (!toastDisplayed) {
                    Toastify({
                        text: `El campo ${id} no puede estar vacío.`,
                        duration: 1500,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733"
                    }).showToast();
                    toastDisplayed = true;
                }
            } else {
                field.classList.remove('border-red-600');
            }
        });
        if (!valid) {
            return;
        }

        const pcompra = document.getElementById('ccompra');
        const pventa = document.getElementById('cventa');
        const compraValue = parseFloat(pcompra.value);
        const ventaValue = parseFloat(pventa.value);

        if (!isNaN(compraValue) && !isNaN(ventaValue) && compraValue >= ventaValue) {
            pcompra.classList.add('border-red-600');
            pventa.classList.add('border-red-600');
            valid = false;
            if (!toastDisplayed) { // Mostrar Toastify solo una vez
                Toastify({
                    text: "El precio de compra debe ser menor al precio de venta.",
                    duration: 1500,
                    gravity: "top",
                    position: "right",
                    backgroundColor: "#FF5733"
                }).showToast();
                toastDisplayed = true;
            }
        } else {
            pcompra.classList.remove('border-red-600');
            pventa.classList.remove('border-red-600');
        }

        if (valid) {
            this.submit();
        }

    });
    document.querySelectorAll('input, textarea, select').forEach(input => {
        input.addEventListener('focus', function () {
            this.classList.remove('border-red-600');
        });
        input.addEventListener('focusout', function () {
            if (input.value.toString() === '') {
                this.classList.add('border-red-600');
            }
        });
    });
    const detailsProducto = element => {
        // Extrae los datos del usuario del elemento
        const descrip = element.getAttribute('data-descrip') || '';
        const estado = element.getAttribute('data-estado') || '';
        const nombre = element.getAttribute('data-nombre') || '';
        const categ = element.getAttribute('data-categ') || '';
        const prov = element.getAttribute('data-prov') || '';
        const pcompra = element.getAttribute('data-pcompra') || '';
        const pventa = element.getAttribute('data-pventa') || '';
        // Llena los campos del formulario de edición con los datos del usuario
        document.getElementById('dddescrip').textContent = descrip;
        document.getElementById('ddestado').textContent = estado;
        document.getElementById('ddnombre').textContent = nombre;
        document.getElementById('ddcateg').textContent = categ;
        document.getElementById('ddprov').textContent = prov;
        document.getElementById('ddcompra').textContent = 'S/ ' + pcompra;
        document.getElementById('ddventa').textContent = 'S/ ' + pventa;
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
    const showModalCreate = () => {
        limpiarModalCreate();
        const modal = document.getElementById('modalCreate');
        modal.classList.remove('hidden');
    };
    const closeModalCreate = () => {
        document.querySelectorAll('input, textarea, select').forEach(input => {
            input.classList.remove('border-red-600');
        });
        const modal = document.getElementById('modalCreate');
        modal.classList.add('hidden');
        limpiarModalCreate();
    };
    const limpiarModalDetails = () => {
        document.getElementById('dddescrip').value = '';
        document.getElementById('ddestado').value = '';
        document.getElementById('ddnombre').value = '';
        document.getElementById('ddcateg').value = '';
        document.getElementById('ddprov').value = '';
        document.getElementById('ddcompra').value = '';
        document.getElementById('ddventa').value = '';
    };
    const limpiarModalCreate = () => {
        document.getElementById('cdescrip').value = '';
        document.getElementById('cestado').value = '';
        document.getElementById('cnombre').value = '';
        document.getElementById('ccateg').value = '';
        document.getElementById('cprov').value = '';
        document.getElementById('ccompra').value = '';
        document.getElementById('cventa').value = '';
    };
    $(document).ready(function () {
        // Inicializa la DataTable
        $('#tablaProducto').DataTable({
            paging: false,
            scrollCollapse: true,
            scrollY: '50vh',
            columnDefs: [
                {className: "text-center", targets: [5]},
                {className: "text-left", targets: [1, 2, 3, 4]},
                {orderable: false, targets: [7]},
                {searchable: false, targets: [0, 6]},
                {width: "16%", targets: [1]},
                {width: "30%", targets: [2]},
                {width: "8%", targets: [5, 6]},
                {width: "4%", targets: [7]}
            ],
            language: {
                lengthMenu: "Mostrar _MENU_ registros por pagina",
                search: "Buscar",
                zeroRecords: "Ningun producto encontrado",
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
        const table = document.getElementById('tablaProducto');
        // Inserta el nuevo div antes de la tabla
        table.parentNode.insertBefore(div, table);
        // Mueve la tabla dentro del nuevo div
        div.appendChild(table);
    });
</script>
