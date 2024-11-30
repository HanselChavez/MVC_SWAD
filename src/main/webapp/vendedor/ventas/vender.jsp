<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="dao.ProductoDAO"%>
<%@page import="model.Producto"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="model.Categoria"%>
<%@page import="java.io.IOException"%>

<title>Venta de Productos</title>

<div class="mx-auto">
    <h1 class="text-4xl font-bold mb-6 text-center">Venta de Productos</h1>

    <div class="flex-col lg:flex-row flex gap-2">
        <div class="lg:w-3/5">
            <div class="flex flex-col gap-2">
                <div>
                    <input type="text" id="search" class="w-full px-4 py-2 border rounded" placeholder="Buscar productos...">
                </div>
                <div>
                    <div class="flex space-x-4 mb-4">
                        <%
                            // Obtener las categorías desde la base de datos
                            CategoriaDAO categoriaDAO = new CategoriaDAO();
                            List<Categoria> categorias = categoriaDAO.getCategories();
                            for (Categoria categoria : categorias) {
                        %>
                        <button class="px-4 py-2 bg-blue-500 text-white rounded" onclick="filterByCategory(<%= categoria.getId()%>)">
                            <%= categoria.getNombre()%>
                        </button>
                        <% } %>
                    </div>
                </div>
            </div>

            <!-- Lista de productos filtrados -->
            <div id="product-list" class="max-h-[300px] lg:max-h-[calc(100vh-300px)] overflow-auto grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                <%-- Mostrar productos al inicio sin filtro --%>
                <%
                    ProductoDAO productoDAO = new ProductoDAO();
                    List<Producto> productos = productoDAO.getProducts();
                    for (Producto producto : productos) {
                %>
                <div class="bg-white p-4 rounded shadow-lg hover:shadow-xl transition-shadow" id="product-<%= producto.getId()%>">
                    <img src="<%= producto.getImagenPrincipal()%>" alt="<%= producto.getNombre()%>" class="w-full object-fit mb-4">
                    <h3 class="text-xl font-semibold mb-2"><%= producto.getNombre()%></h3>
                    <p class="text-gray-600 mb-2"><%= producto.getDescripcion()%></p>
                    <p class="text-lg font-bold text-blue-500 mb-4">$<%= producto.getPrecioVenta()%></p>
                    <button class="bg-green-500 text-white px-4 py-2 rounded" onclick="addToCart(<%= producto.getId()%>)">
                        Agregar al carrito
                    </button>
                </div>
                <% }%>
            </div>
        </div>

        <div class="lg:w-2/5">
            <h2 class="text-2xl font-bold mb-4">Productos Seleccionados</h2>
            <div id="cart-list" class="space-y-4">
            </div>
            <button class="w-full bg-blue-500 text-white py-2 rounded mt-4" onclick="sellProducts()">Vender</button>
        </div>                
    </div>
</div>

<script>
    function filterByCategory(categoryId) {
        fetch('/Producto/filterByCategory?categoryId=' + categoryId)
                .then(response => response.json())
                .then(data => {
                    const productList = document.getElementById('product-list');
                    productList.innerHTML = '';

                    if (data.length === 0) {
                        const noProductsMessage = document.createElement('div');
                        noProductsMessage.classList.add('text-center', 'p-4', 'text-gray-500');
                        noProductsMessage.innerHTML = `
                <i class="fas fa-exclamation-circle text-red-500"></i> 
                <span>No se encontraron productos en esta categoría.</span>
            `;
                        productList.appendChild(noProductsMessage);
                        return;
                    }

                    data.forEach(producto => {
                        console.log(producto);

                        const productDiv = document.createElement('div');
                        productDiv.classList.add('bg-white', 'p-4', 'rounded', 'shadow-lg', 'hover:shadow-xl', 'transition-shadow');

                        const imagen = producto.listaImagenes && producto.listaImagenes.length > 0 ? producto.listaImagenes[0].imagen : '/img/default-img.jpg';
                        const productoImagen = document.createElement('img');
                        productoImagen.src = imagen;
                        productoImagen.alt = producto.nombre;
                        productoImagen.classList.add('w-full', 'object-fit', 'mb-4');

                        const productoNombre = document.createElement('h3');
                        productoNombre.textContent = producto.nombre;
                        productoNombre.classList.add('text-xl', 'font-semibold', 'mb-2');

                        const productoDescripcion = document.createElement('p');
                        productoDescripcion.textContent = producto.descripcion;
                        productoDescripcion.classList.add('text-gray-600', 'mb-2');

                        const productoPrecio = document.createElement('p');
                        productoPrecio.textContent = '$'
                        const span = document.createElement('span');
                        span.textContent = producto.precioVenta;
                        productoPrecio.appendChild(span)
                        productoPrecio.classList.add('text-lg', 'font-bold', 'text-blue-500', 'mb-4');

                        const categoriaNombre = producto.categoria ? producto.categoria.nombre : 'Categoría desconocida';
                        const productoCategoria = document.createElement('p');
                        productoCategoria.textContent = `Categoría: ${categoriaNombre}`;
                        productoCategoria.classList.add('text-sm', 'text-gray-500', 'mb-4');


                        const estadoNombre = producto.estado ? producto.estado.nombre : 'Estado desconocido';


                        const addButton = document.createElement('button');
                        addButton.classList.add('bg-green-500', 'text-white', 'px-4', 'py-2', 'rounded');
                        addButton.textContent = 'Agregar al carrito';
                        addButton.onclick = function () {
                            addToCart(producto.id);
                        };

                        productDiv.appendChild(productoImagen);
                        productDiv.appendChild(productoNombre);
                        productDiv.appendChild(productoDescripcion);
                        productDiv.appendChild(productoPrecio);
                        productDiv.appendChild(addButton);

                        productList.appendChild(productDiv);
                    });
                })
                .catch(error => {
                    console.error('Error al obtener productos:', error);
                    const productList = document.getElementById('product-list');
                    productList.innerHTML = '<p class="text-red-500">Hubo un error al cargar los productos. Intenta nuevamente.</p>';
                });
    }

    function addToCart(productId) {
        const cartList = document.getElementById('cart-list');
        const newItem = document.createElement('div');
        newItem.classList.add('bg-gray-100', 'p-4', 'rounded', 'shadow-lg');
        newItem.innerHTML = `Producto ID: ${productId}`;
        cartList.appendChild(newItem);
    }

    function sellProducts() {
        alert('Productos vendidos!');
    }
</script>