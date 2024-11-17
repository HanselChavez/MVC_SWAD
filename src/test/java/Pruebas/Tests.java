package Pruebas;

import dao.ProductoDAO;
import dao.ProveedorDAO;
import dao.UsuarioDAO;
import java.sql.Connection;
import java.util.List;
import model.Producto;
import model.Proveedor;
import model.Usuario;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import static org.junit.Assert.*;
import org.junit.Test;
import utilidades.Conexion;

/**
 *
 * @author Chavez
 */
public class Tests {

    public Tests() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }
    private Conexion instance;
    private Connection cn;

    //TEST 1
    //@Test
    public void testProbarConexion() throws Exception {
        System.out.println("Iniciando test: testPruebaConexion");
        instance = new Conexion();
        // Act: Intentar conectar
        cn = instance.conecta();

        //assertNotNull("La conexión debería estar establecida correctamente.", cn);
        // Verificar si la conexión está activa (no es nula y no está cerrada)
        int valorConexion = instance.verificarConexion(cn);
        assertEquals("Conexion abierta correctamente.", 1, valorConexion);

        // Cerrar recursos
        instance.closeResources(cn);
        System.out.println("Recursos cerrados correctamente.");
    }
    //TEST 2

    //@Test
    public void testAutenticarCredenciales() {
        String email = "juan.perez@empresa.com";
        String password = "Abcd1234$";
        Long expectedRoleId = Long.valueOf(1);

        UsuarioDAO usuarioDAO = new UsuarioDAO();

        System.out.println("Iniciando prueba de autenticación...");

        Usuario usuarioAutenticado = usuarioDAO.authenticate(email, password, "192");

        assertNotNull("El usuario autenticado no debería ser nulo.", usuarioAutenticado);

        assertEquals("El resultado de la autenticación no es el esperado.", expectedRoleId, usuarioAutenticado.getRol().getId());

        System.out.println("Prueba de autenticación completada con éxito.");
    }

    //TEST 3
    // @Test
    public void testCrearUsuario() {
        System.out.println("Iniciando prueba de inserción de usuario...");

        String dni = "55552123";
        String nombres = "Kelvin Trucho";
        String correo = "kelvin.lucana@gmail.com";
        String contra = "12345";
        String apePaterno = "Vasquez";
        String apeMaterno = "Donofrio";
        String telefono = "192402952";
        int usuCreador = 1;
        int idRol = 1;

        UsuarioDAO instance = new UsuarioDAO();

        int expResult = 1;

        int result = instance.createUser(dni, nombres, correo, contra, apePaterno, apeMaterno, telefono, idRol, usuCreador);

        assertEquals("El resultado de la creación del usuario no es el esperado. Verifica los parámetros de entrada y el estado de la base de datos.", expResult, result);

        System.out.println("Prueba de inserción completada.");

    }
    //TEST 4

    // @Test
    public void testEditarUsuario() {
        System.out.println("Iniciando prueba de edición de datos de usuario...");

        // Datos de prueba para el usuario
        int id = 4;
        String dni = "55552142";
        String nombres = "Kelvin Lucario";
        String apePaterno = "Vasquez";
        String apeMaterno = "Fuentes";
        String correo = "kelvin.lucario@gmail.com";
        String contra = "12345";
        String telefono = "994934099";
        int idRol = 1;
        int idEstado = 2;

        // Instancia del objeto Usuario y el valor esperado
        UsuarioDAO instance = new UsuarioDAO();
        int expResult = 1;

        // Ejecución del método de edición
        int result = instance.editUser(id, dni, nombres, correo, contra, apePaterno, apeMaterno, telefono, idRol, idEstado);

        // Verificación del resultado
        assertEquals("El resultado de la edición del usuario no es el esperado.", expResult, result);

        System.out.println("Prueba de edición completada.");
    }

    //@Test
    public void testObtenerProductoPorCategoria() {
        System.out.println("Iniciando test: Obtener productos por categoría");

        String categoria = "1";
        ProductoDAO instance = new ProductoDAO();

        int expResult = 4;
        System.out.println("Categoría seleccionada: " + categoria);
        System.out.println("Número esperado de productos: " + expResult);
        System.out.println("Productos obtenidos:");
        List<Producto> productos = instance.getProductosByCategoria(categoria);
        int result = productos.size();

        System.out.println("Número obtenido de productos: " + result);
        assertEquals(expResult, result);

        System.out.println("Test finalizado.");
    }

    //TEST 6
    //  @Test
    public void testObtenerProveedores() {
        System.out.println("Iniciando prueba del método getProveedores.");

        // Crear una instancia de Proveedor
        ProveedorDAO instance = new ProveedorDAO();

        int expResult = 4;
        System.out.println("Número esperado de proveedores: " + expResult);

        // Obtener la lista de proveedores desde el método
        System.out.println("Obteniendo la lista de proveedores.");
        List<Proveedor> proveedores = instance.getProveedores();
        int result = proveedores.size();

        // Mostrar el número de proveedores obtenidos
        System.out.println("Número obtenido de proveedores: " + result);

        // Comparar la lista esperada con la obtenida
        try {
            assertEquals("El número de proveedores obtenidos no coincide con el número esperado.", expResult, result);
            System.out.println("La prueba del método getProveedores fue exitosa.");
        } catch (AssertionError e) {
            System.err.println("Fallo en la prueba del método getProveedores: " + e.getMessage());
            throw e; // Rethrow para que el marco de pruebas registre el error
        }
    }
    //TEST 7

    //@Test 
    /*
    public void testCrearProveedor() {
        // Preparar datos de prueba
        String empresa = "Calapuja Industries";
        String ruc = "20129493921";
        String direccion = "Av Siempre Feliz 240";
        String telefono = "123948578";
        String email = "calapuja.industries@gmail.com";

        ProveedorDAO instance = new ProveedorDAO();

        int expected = 1;

       int actual = instance.createProveedor(empresa, telefono, ruc, direccion, email);

        System.out.println("Expected number of rows inserted: " + expected);
        System.out.println("Actual number of rows inserted: " + actual);

        assertEquals("El número de filas insertadas no es el esperado.", expected, actual);

        Proveedor proveedorCreado = instance.getProveedorByRuc(ruc);
        if (proveedorCreado != null) {
            System.out.println("Proveedor creado correctamente.");
            System.out.println("Empresa del proveedor creado: " + proveedorCreado.getEmpresa());
        } else {
            System.out.println("Proveedor no encontrado.");
        }
    }

    //TEST 8
    //@Test
    public void testObtenerProveedorPorId() {
        System.out.println("Iniciando prueba: obtenerProveedorPorId");

        // Datos de entrada y resultados esperados
        String id = "4";
        String empresa = "Calapuja Industries";
        String ruc = "20129493921";
        String direccion = "Av Siempre Feliz 240";
        String telefono = "123948578";
        String email = "calapuja.industries@gmail.com";

        Proveedor expResult = new Proveedor();
        expResult.setId(Long.valueOf(id));
        expResult.setEmpresa(empresa);
        expResult.setCorreo(email);
        expResult.setRuc(ruc);
        expResult.setDireccion(direccion);
        expResult.setTelefono(telefono);

        // Crear una instancia de la clase que contiene el método
        ProveedorDAO instance = new ProveedorDAO();

        // Ejecutar el método a probar
        Proveedor result = instance.getProveedorById(id);

        // Verificar resultados
        assertNotNull("El resultado no debe ser nulo", result);
        assertEquals("El ID del proveedor no coincide", expResult.getId(), result.getId());
        assertEquals("La empresa del proveedor no coincide", expResult.getEmpresa(), result.getEmpresa());
        assertEquals("El RUC del proveedor no coincide", expResult.getRuc(), result.getRuc());
        assertEquals("La dirección del proveedor no coincide", expResult.getDireccion(), result.getDireccion());
        assertEquals("El teléfono del proveedor no coincide", expResult.getTelefono(), result.getTelefono());
        assertEquals("El correo del proveedor no coincide", expResult.getCorreo(), result.getCorreo());

        System.out.println("Prueba completada con éxito: obtenerProveedorPorId");
    }
    //TEST 9

    //@Test
    public void testEliminarProveedorPorId() {
        System.out.println("Iniciando prueba de eliminación de proveedor.");

        String id = "4";
        ProveedorDAO instance = new ProveedorDAO();
        int expResult = 1;

        System.out.println("Intentando eliminar el proveedor con ID: " + id);

        int result = instance.deleteProveedor(id);

        System.out.println("Resultado de la eliminación: " + result);

        try {
            assertEquals("El número de filas afectadas no es el esperado.", expResult, result);
            System.out.println("Prueba de eliminación exitosa.");
        } catch (AssertionError e) {
            System.err.println("Fallo en la prueba de eliminación: " + e.getMessage());
            throw e;
        }
    }

    //TEST 10
    // @Test
    public void testSetAndGetMethodsOfProveedor() {
        System.out.println("Iniciando prueba de métodos set y get en la clase Proveedor.");

        Long id = 2L;
        String empresa = "Empresa Test";
        String telefono = "123456789";
        String ruc = "987654321";
        String direccion = "Dirección Test";
        String correo = "test@test.com";

        // Crear una instancia de Proveedor y configurar valores
        Proveedor proveedor = new Proveedor();
        proveedor.setId(id);
        proveedor.setEmpresa(empresa);
        proveedor.setTelefono(telefono);
        proveedor.setRuc(ruc);
        proveedor.setDireccion(direccion);
        proveedor.setCorreo(correo);

        // Validar los valores establecidos con los métodos get
        try {
            assertEquals("El ID del proveedor no coincide con el valor esperado.", id, proveedor.getId());
            System.out.println("ID del proveedor verificado correctamente.");

            assertEquals("El nombre de la empresa del proveedor no coincide con el valor esperado.", empresa, proveedor.getEmpresa());
            System.out.println("Nombre de la empresa del proveedor verificado correctamente.");

            assertEquals("El teléfono del proveedor no coincide con el valor esperado.", telefono, proveedor.getTelefono());
            System.out.println("Teléfono del proveedor verificado correctamente.");

            assertEquals("El RUC del proveedor no coincide con el valor esperado.", ruc, proveedor.getRuc());
            System.out.println("RUC del proveedor verificado correctamente.");

            assertEquals("La dirección del proveedor no coincide con el valor esperado.", direccion, proveedor.getDireccion());
            System.out.println("Dirección del proveedor verificada correctamente.");

            assertEquals("El correo del proveedor no coincide con el valor esperado.", correo, proveedor.getCorreo());
            System.out.println("Correo del proveedor verificado correctamente.");

        } catch (AssertionError e) {
            System.err.println("Fallo en la prueba de métodos set y get: " + e.getMessage());
            throw e; // Rethrow para que el marco de pruebas registre el error
        }

        System.out.println("Prueba de métodos set y get completada con éxito.");
    }*/
}
