package controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.ProductoDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "Producto", urlPatterns = {"/Producto", "/Producto/add", "/Producto/edit", "/Producto/delete"})
public class ProductController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null) {
            switch (action) {
                case "/Producto/add":
                    handleAddProducto(request, response);
                    break;
                case "/Producto/edit":
                    handleEditProducto(request, response);
                    break;
                case "/Producto/delete":
                    handleDeleteProducto(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    break;
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/Producto/add":
            case "/Producto/edit":
            case "/Producto/delete":
                HttpSession sesion = request.getSession();
                if (sesion.getAttribute("userlog") != null) {
                    response.sendRedirect("/admin?pagina=producto");
                    switch (sesion.getAttribute("rol").toString()) {
                        case "1":
                            response.sendRedirect("/admin?pagina=producto");
                            break;
                        case "2":
                            response.sendRedirect("/vendedor?pagina=productos");
                            break;
                        default:
                            response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
    private static final String UPLOAD_DIR = "uploads";

    private void handleAddProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del request
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double preciocompra = Double.parseDouble(request.getParameter("pcompra"));
        double precioventa = Double.parseDouble(request.getParameter("pventa"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idProveedor = Integer.parseInt(request.getParameter("proveedor"));
        int idEstado = Integer.parseInt(request.getParameter("estado"));

        // Guardar las imágenes en una carpeta
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String imagenPrincipalPath = null;
        List<String> imagenesSecundariasPaths = new ArrayList<>();

        // Obtener todas las partes del request
        Collection<Part> fileParts = request.getParts(); // Obtener todas las partes del request

        for (Part filePart : fileParts) {
            // Manejar la imagen principal
            if (filePart.getName().equals("imagenPrincipal")) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) { // Asegurarse de que el archivo no esté vacío
                    imagenPrincipalPath = uploadPath + File.separator + fileName;
                    filePart.write(imagenPrincipalPath); // Guardar la imagen principal
                    imagenPrincipalPath = "\\" + UPLOAD_DIR + "\\" + fileName;
                }
            }
        }

        // Obtener la lista de imágenes secundarias desde el campo oculto
        String imagenesSecundariasData = request.getParameter("imagenesSecundariasData");
        if (imagenesSecundariasData != null && !imagenesSecundariasData.isEmpty()) {
            // Convertir el JSON a una lista de rutas de imágenes
            ObjectMapper objectMapper = new ObjectMapper();
            imagenesSecundariasPaths = objectMapper.readValue(imagenesSecundariasData, new com.fasterxml.jackson.core.type.TypeReference<List<String>>() {
            });
        }
        for (int i = 0; i < imagenesSecundariasPaths.size(); i++) {
            String img = imagenesSecundariasPaths.get(i);
            imagenesSecundariasPaths.set(i, "\\" + UPLOAD_DIR + "\\" + img);
        }

        System.out.println("***************AQUI ANTES DE CREAR***************");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null) {
            ProductoDAO prod = new ProductoDAO();
            prod.createProduct(nombre, descripcion, idCategoria,
                    idProveedor, idEstado, preciocompra,
                    precioventa, imagenPrincipalPath, imagenesSecundariasPaths // Pasar la imagen principal y la lista de imágenes secundarias
            );

            System.out.println("***************DESPUES DE CREAR***************");

            switch (sesion.getAttribute("userlog").toString()) {
                case "1":
                    response.sendRedirect("/admin?pagina=producto");
                    break;
                case "2":
                    response.sendRedirect("/vendedor?pagina=productos");
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    /*    private void handleAddProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del request
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double preciocompra = Double.parseDouble(request.getParameter("pcompra"));
        double precioventa = Double.parseDouble(request.getParameter("pventa"));
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idProveedor = Integer.parseInt(request.getParameter("proveedor"));
        int idEstado = Integer.parseInt(request.getParameter("estado"));

        // Guardar las imágenes en una carpeta
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String imagenPrincipalPath = null;
        List<String> imagenesSecundariasPaths = new ArrayList<>();

        // Obtener todas las partes del request
        Collection<Part> fileParts = request.getParts(); // Obtener todas las partes del request

        for (Part filePart : fileParts) {
            // Manejar la imagen principal
            if (filePart.getName().equals("imagenPrincipal")) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) { // Asegurarse de que el archivo no esté vacío
                    imagenPrincipalPath = uploadPath + File.separator + fileName;
                    System.out.println(fileName);
                    filePart.write(imagenPrincipalPath); // Guardar la imagen principal
                    imagenPrincipalPath = "\\" + UPLOAD_DIR + "\\" + fileName;
                }
            }

            // Manejar imágenes secundarias
            if (filePart.getName().equals("imagenesSecundarias")) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) { // Asegurarse de que el archivo no esté vacío
                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath); // Guardar la imagen secundaria
                    filePath = "\\" + UPLOAD_DIR + "\\" + fileName;
                    imagenesSecundariasPaths.add(filePath);
                }
            }
        }

        System.out.println("***************AQUI ANTES DE CREAR***************");
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("userlog") != null) {
            ProductoDAO prod = new ProductoDAO();
            prod.createProduct(nombre, descripcion, idCategoria,
                    idProveedor, idEstado, preciocompra,
                    precioventa, imagenPrincipalPath, imagenesSecundariasPaths // Pasar la imagen principal y la lista de imágenes secundarias
            );

            System.out.println("***************DESPUES DE CREAR***************");

            switch (sesion.getAttribute("userlog").toString()) {
                case "1":
                    response.sendRedirect("/admin?pagina=producto");
                    break;
                case "2":
                    response.sendRedirect("/vendedor?pagina=productos");
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
     */
    private void handleDeleteProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");

        System.out.println("***************AQUI ANTES DE ELIMINAR***************");
        ProductoDAO prod = new ProductoDAO();
        prod.deleteProduct(id);
        System.out.println("***************DESPUES DE ELIMINAR***************");
        response.sendRedirect("/admin?pagina=producto");
    }

    private void handleEditProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String descripcion = request.getParameter("descripcion");
        String nombre = request.getParameter("nombre");
        int idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int idProveedor = Integer.parseInt(request.getParameter("proveedor"));
        int idEstado = Integer.parseInt(request.getParameter("estado"));
        double preciocompra = Double.parseDouble(request.getParameter("pcompra"));
        double precioventa = Double.parseDouble(request.getParameter("pventa"));
        //  String imagen = request.getParameter("imagen");
        System.out.println("***************AQUI ANTES DE EDITAR***************");
        ProductoDAO prod = new ProductoDAO();

        // Guardar las imágenes en una carpeta
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String imagenPrincipalPath = null;
        List<String> imagenesSecundariasPaths = new ArrayList<>();

        // Obtener todas las partes del request
        Collection<Part> fileParts = request.getParts(); // Obtener todas las partes del request

        for (Part filePart : fileParts) {
            // Manejar la imagen principal
            if (filePart.getName().equals("imagenPrincipal")) {
                String fileName = filePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) { // Asegurarse de que el archivo no esté vacío
                    imagenPrincipalPath = uploadPath + File.separator + fileName;
                    filePart.write(imagenPrincipalPath); // Guardar la imagen principal
                    imagenPrincipalPath = "\\" + UPLOAD_DIR + "\\" + fileName;
                }
            }
        }

        // Obtener la lista de imágenes secundarias desde el campo oculto
        String imagenesSecundariasData = request.getParameter("imagenesSecundariasData");
        if (imagenesSecundariasData != null && !imagenesSecundariasData.isEmpty()) {
            // Convertir el JSON a una lista de rutas de imágenes
            ObjectMapper objectMapper = new ObjectMapper();
            imagenesSecundariasPaths = objectMapper.readValue(imagenesSecundariasData, new com.fasterxml.jackson.core.type.TypeReference<List<String>>() {
            });
        }

        /*
        int count = 0;
        for (String img : imagenesSecundariasPaths) {

            // Aquí puedes manejar la lógica para obtener el Part correspondiente
            Part secondaryImagePart = request.getPart(img); // Debes asegurarte que esta parte exista
            if (secondaryImagePart != null) {
                String fileName = secondaryImagePart.getSubmittedFileName();
                if (fileName != null && !fileName.isEmpty()) {
                    String secondaryImagePath = uploadPath + File.separator + fileName;
                    secondaryImagePart.write(secondaryImagePath); // Guardar imagen secundaria
                    imagenesSecundariasPaths.set(count, "\\" + UPLOAD_DIR + "\\" + fileName); // Actualiza la ruta
                    count++;
                }
            }
        }*/
        for (int i = 0; i < imagenesSecundariasPaths.size(); i++) {
            String img = imagenesSecundariasPaths.get(i);
            imagenesSecundariasPaths.set(i, "\\" + UPLOAD_DIR + "\\" + img);
        }

        HttpSession sesion = request.getSession();
        String idModificador = sesion.getAttribute("idUsuario").toString();

        prod.editProduct(nombre, id, descripcion, idCategoria, idProveedor, idEstado, preciocompra, precioventa, idModificador, imagenPrincipalPath, imagenesSecundariasPaths);
        System.out.println("***************DESPUES DE EDITAR***************");
        response.sendRedirect("/admin?pagina=producto");
    }
}
