<%-- 
    Document   : listado
    Created on : 14 oct. 2023, 09:59:54
    Author     : Estudiante
--%>

<%@page import="model.ImagenProducto"%>
<%@page import="dao.EstadoProductoDAO"%>
<%@page import="dao.ProveedorDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.EstadoProducto"%>
<%@page import="model.Proveedor"%>
<%@page import="model.Categoria"%>
<%@page import="model.Producto, java.util.List, java.util.LinkedList" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Listado de Productos</title>        
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css"/>
    <!-- Incluir jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- Incluir DataTables JS desde CDN -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
</head>
<%
    ProductoDAO PD = new ProductoDAO();
    List<Producto> lista = new LinkedList<>();
    lista = PD.getProducts();
    CategoriaDAO CT = new CategoriaDAO();
    List<Categoria> categorias = new LinkedList<>();
    categorias = CT.getCategories();
    ProveedorDAO P = new ProveedorDAO();
    List<Proveedor> proveedores = new LinkedList<>();
    proveedores = P.getProveedores();
    EstadoProductoDAO EP = new EstadoProductoDAO();
    List<EstadoProducto> estados = new LinkedList<>();
    estados = EP.getEstados();
    String idParam = request.getParameter("id");
    Long id = Long.parseLong(idParam);
    Producto producto = PD.getProductById(id);
%>


<h1 class="text-4xl font-bold text-black">Editar Producto</h1>
<form id="editForm" action="/Producto/edit" method="post" enctype="multipart/form-data" class="text-black my-6 flex gap-y-4 md:gap-y-6 flex-col xs:flex-row flex-wrap w-full">
    <input id="eid" name="id" type="text" hidden value="<%=producto.getId()%>">
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4 md:pr-4">
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="enombre" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Nombre</label>
            <input id="enombre" name="nombre" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" value="<%=producto.getNombre()%>">
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="edescrip" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Descripci�n</label>
            <textarea id="edescrip" name="descripcion" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" rows="3"><%=producto.getDescripcion()%></textarea>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="eestado" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Estado</label>
            <select name="estado" id="eestado" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                <%
                    if (estados != null) {
                        for (EstadoProducto ep : estados) {
                %>
                <option value="<%=ep.getId()%>" <%= producto.getEstado().getId().equals(ep.getId()) ? "selected" : ""%>><%=ep.getNombre()%></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
    </div>

    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4">
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="ecateg" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Categor�a</label>
            <select name="categoria" id="ecateg" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                <%
                    if (categorias != null) {
                        for (Categoria ct : categorias) {
                %>
                <option value="<%=ct.getId()%>" <%= producto.getCategoria().getId().equals(ct.getId()) ? "selected" : ""%>><%=ct.getNombre()%></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="eprov" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Proveedor</label>
            <select name="proveedor" id="eprov" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md">
                <%
                    if (proveedores != null) {
                        for (Proveedor p : proveedores) {
                %>
                <option value="<%=p.getId()%>" <%= producto.getProveedor().getId().equals(p.getId()) ? "selected" : ""%>><%=p.getEmpresa()%></option>
                <%
                        }
                    }
                %>
            </select>
        </div>
        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="ecompra" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Precio Compra</label>
            <input id="ecompra" name="pcompra" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" value="<%=producto.getPrecioCompra()%>">
        </div>

        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full">
            <label for="eventa" class="text-lg font-medium xs:w-2/4 sm:w-2/5 md:w-2/6">Precio Venta</label>
            <input id="eventa" name="pventa" type="text" class="bg-transparent outline-none font-sans px-2 py-1 w-full border border-secondary-300 rounded-md" value="<%=producto.getPrecioVenta()%>">
        </div>


    </div>
    <div class="flex flex-col gap-y-4 md:gap-y-6 w-full md:w-2/4 md:pr-4">
        <div class="flex flex-col xs:flex-row gap-0.5 relative justify-between xs:items-center w-full">
            <label for="imagenPrincipal" class="text-lg font-medium">Imagen Principal:</label>
            <input type="file" data-name="<%=producto.getImagenPrincipal().substring(producto.getImagenPrincipal().lastIndexOf('\\') + 1)%>" name="imagenPrincipal" id="imagenPrincipal" class="border border-secondary-300 rounded-md">
            <span class="text-xs top-8 font-semibold right-2 text-red-500 absolute hidden" id="imagenPrincipalError">Este campo es obligatorio</span>
        </div>
        <div id="previewPrincipalContainer" class="relative max-w-40 mt-2">
            <img id="previewPrincipal" src="<%=producto.getImagenPrincipal()%>" alt="<%=producto.getNombre()%>" class="rounded-md max-w-40 block" />
            <button onclick="removePrincipalImage()" type="button" class="absolute top-1 right-1 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center hover:bg-red-700">
                &times;
            </button>
        </div>

        <div class="flex flex-col xs:flex-row gap-0.5 justify-between xs:items-center w-full mt-4">
            <label for="imagenesSecundarias" class="text-lg font-medium">Im�genes Secundarias:</label>
            <input type="file" name="imagenesSecundarias" id="imagenesSecundarias" class="border border-secondary-300 rounded-md" multiple>
            <input type="hidden" name="imagenesSecundariasData" id="imagenesSecundariasData">
            <button onclick="addSecundarias()" type="button" class="bg-blue-500 text-white rounded-md px-4 py-1 hover:bg-blue-700">Agregar</button>
        </div>
    </div>

    <div id="secundariasContainer" class="flex gap-2 mt-4 flex-wrap">
        <% if (producto != null) { %>
        <% for (ImagenProducto ip : producto.getImagenesSecundarias()) {%>
        <div class="relative max-w-40 m-1">
            <img src="<%=ip.getImagen()%>" data-name="<%=ip.getImagen().substring(ip.getImagen().lastIndexOf('\\') + 1)%>" class="imgSecu rounded-md max-w-40" />
            <button onclick="removeImage(this)" type="button" class="absolute top-0 right-0 bg-red-500 text-white rounded-full w-5 h-5 flex items-center justify-center hover:bg-red-700">
                &times;
            </button>
        </div>
        <% } %>
        <% }%>
    </div>

    <div class="flex flex-col xs:flex-row w-full gap-4 justify-evenly">
        <a href="/admin?pagina=producto" class="hover:bg-red-800 text-white cursor-pointer transition-all duration-500 bg-red-600 px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Cancelar</a>
        <button type="submit" class="hover:bg-green-800 text-white cursor-pointer transition-all duration-500 bg-green-600 px-5 justify-center py-1 rounded-md font-medium text-lg flex gap-2 items-center">Guardar Cambios</button>
    </div>
</form>
<script>
    const form = document.getElementById('editForm');
    const fieldsToValidate = [
        {id: 'imagenPrincipal', errorId: 'imagenPrincipalError'}
    ];

    form.addEventListener('submit', (event) => {
        let isValid = true;

        // Validar campos
        fieldsToValidate.forEach(field => {
            const input = document.getElementById(field.id);
            const errorText = document.getElementById(field.errorId);
            if (!input?.dataset?.name) {
                input.classList.add('border-red-500');
                errorText.classList.remove('hidden');
                isValid = false;
                setTimeout(() => {
                    input.classList.remove('border-red-500');
                    errorText.classList.add('hidden');
                }, 3000);
            }
        });

        const existingImages = Array.from(document.querySelectorAll('#secundariasContainer img')).map(img => img.src);
        const principalImage = document.getElementById("previewPrincipal").src;
        // Validar im�genes secundarias
        if (existingImages.length !== new Set(existingImages).size) {
            Toastify({
                text: "Hay im�genes repetidas en las im�genes secundarias.",
                duration: 2000,
                gravity: "top",
                position: "right",
                backgroundColor: "#FF5733",
            }).showToast();
            isValid = false;
        }

        // Validar que la imagen principal no se repita en las secundarias
        if (existingImages.includes(principalImage)) {
            Toastify({
                text: "La imagen principal no puede ser igual a una imagen secundaria.",
                duration: 2000,
                gravity: "top",
                position: "right",
                backgroundColor: "#FF5733",
            }).showToast();
            isValid = false;
        }

        if (!isValid) {
            event.preventDefault();
        }
        updateHiddenField();
    });
    let principalName = document.getElementById("imagenPrincipal").dataset.name;
    const principalInput = document.getElementById("imagenPrincipal");
    principalInput.addEventListener('change', (event) => {
        const file = event.target.files[0];
        if (file) {
            principalName = file.name;

            const reader = new FileReader();
            reader.onload = function (e) {
                const existingImages = document.querySelectorAll('#secundariasContainer .imgSecu');
                const isDuplicate = Array.from(existingImages).some(existingImg => existingImg.dataset.name === principalName);
                if (isDuplicate) {
                    document.getElementById("previewPrincipal").src = "";
                    document.getElementById("previewPrincipalContainer").classList.add("hidden");
                    Toastify({
                        text: "Esta imagen ya ha sido agregada como imagen secundaria.",
                        duration: 2000,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    event.preventDefault();
                    document.getElementById("imagenPrincipal").value = "";
                    return;
                }
                principalInput.dataset.name = file.name;
                document.getElementById("previewPrincipal").src = e.target.result;
                document.getElementById("previewPrincipalContainer").classList.remove("hidden");
            };
            reader.readAsDataURL(file);

        } else {
            document.getElementById("previewPrincipal").src = "";
            document.getElementById("previewPrincipalContainer").classList.add("hidden");
        }
    });
    /*function previewPrincipal(event) {
     const file = event.target.files[0];
     if (file) {
     const reader = new FileReader();
     reader.onload = function (e) {
     document.getElementById('previewPrincipal').src = e.target.result;
     document.getElementById('previewPrincipalContainer').style.display = 'block';
     };
     reader.readAsDataURL(file);
     }
     }*/

    function removePrincipalImage() {
        document.getElementById("previewPrincipal").src = '';
        document.getElementById("previewPrincipalContainer").classList.add("hidden");
        principalInput.value = ''; // Resetea el input de imagen principal
    }

    function addSecundarias() {
        const secundariasInput = document.getElementById('imagenesSecundarias');
        const files = secundariasInput.files;
        const container = document.getElementById('secundariasContainer');

        for (let i = 0; i < files.length; i++) {
            const file = files[i];

            const reader = new FileReader();
            reader.onload = function (e) {
                if (principalName === file.name) {
                    Toastify({
                        text: "Esta imagen ya ha sido agregada como imagen principal.",
                        duration: 2000,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                    return;
                }
                const img = document.createElement("img");
                img.src = e.target.result;
                img.dataset.name = file.name;
                img.name = "imagenSecundaria";
                img.classList.add("rounded-md", "max-w-40", "imgSecu");

                // A�adir bot�n de eliminar
                const removeButton = document.createElement("button");
                removeButton.innerHTML = "&times;";
                removeButton.classList.add("absolute", "top-0", "right-0", "bg-red-500", "text-white", "rounded-full", "w-5", "h-5", "flex", "items-center", "justify-center", "hover:bg-red-700");
                removeButton.onclick = function () {
                    removeButton.parentElement.remove();
                    updateHiddenField(); // Actualizar el campo oculto al eliminar la imagen
                };

                // Verificar si ya existe la imagen
                const principalImage = document.getElementById("previewPrincipal").src;
                const existingImages = document.querySelectorAll('#secundariasContainer .imgSecu');
                const isDuplicate = Array.from(existingImages).some(existingImg => existingImg.dataset.name === img.dataset.name || principalName === existingImg.dataset.name);

                if (!isDuplicate) {
                    const imgWrapper = document.createElement("div");
                    imgWrapper.classList.add("relative", "max-w-40", "m-1");
                    imgWrapper.appendChild(img);
                    imgWrapper.appendChild(removeButton);
                    container.appendChild(imgWrapper);
                } else {

                    Toastify({
                        text: "Esta imagen ya ha sido agregada.",
                        duration: 2000,
                        gravity: "top",
                        position: "right",
                        backgroundColor: "#FF5733",
                    }).showToast();
                }
            };
            reader.readAsDataURL(file);
        }

        secundariasInput.value = ''; // Resetea el input de im�genes secundarias
        updateHiddenField();

    }

    function removeImage(button) {
        button.parentElement.remove();
        updateHiddenField(); // Actualizar el campo oculto al eliminar la imagen
    }

    function updateHiddenField() {
        const imgs = document.querySelectorAll('#secundariasContainer .imgSecu');
        const imagenesSecundariasData = Array.from(imgs).map(img => {
            return img.dataset.name; // Guardar las URLs de las im�genes
        });
        document.getElementById("imagenesSecundariasData").value = JSON.stringify(imagenesSecundariasData);
    }
</script>