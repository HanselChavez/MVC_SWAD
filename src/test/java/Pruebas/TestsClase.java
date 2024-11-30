package Pruebas;

import dao.CategoriaDAO;
import dao.UsuarioDAO;
import java.sql.Connection;
import java.util.List;
import model.Categoria;
import model.Producto;
import model.Proveedor;
import model.Usuario;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import utilidades.Conexion;

/**
 *
 * @author Chavez
 */
public class TestsClase {

    public TestsClase() {
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
    public void testAuthenticateInvalidEmailFormat() {
        String invalidEmail = "invalidemail.com";
        String validPassword = "ValidPass1!";
        UsuarioDAO usuarioService = new UsuarioDAO();

        Usuario result = usuarioService.authenticate(invalidEmail, validPassword, "d");

        assertEquals("El ID de Rol debe ser -1 para un correo electrónico no válido.", Long.valueOf(-1L), result.getRol().getId());
    }

    //@Test
    public void testAuthenticateInvalidPasswordFormat() {
        // Arrange
        String validEmail = "validemail@test.com";
        String invalidPassword = "weakpass"; // Contraseña sin caracteres especiales ni mayúsculas
        UsuarioDAO usuarioService = new UsuarioDAO();

        // Act
        Usuario result = usuarioService.authenticate(validEmail, invalidPassword, "1");

        // Assert
        assertEquals("El ID de Rol debe ser -2 para una contraseña no válida.", Long.valueOf(-2L), result.getRol().getId());
    }

    //@Test
    public void testAuthenticateEmailNotRegistered() {
        // Arrange
        String unregisteredEmail = "unregistered@test.com";
        String validPassword = "ValidPass1!";
        UsuarioDAO usuarioService = new UsuarioDAO();

        // Act
        Usuario result = usuarioService.authenticate(unregisteredEmail, validPassword, "1");

        // Assert
        assertEquals("El ID de Rol debe ser -1 para un correo no registrado.", Long.valueOf(-1L), result.getRol().getId());
    }

    //@Test
    public void testAutenticarCredenciales() {
        System.out.println("Iniciando prueba de autenticación...");

        String email = "luis.rodriguez@empresa.com";
        String psw = "Abcd1234$";

        UsuarioDAO instance = new UsuarioDAO();

        // Resultado esperado
        int rolExperado = 3;

        // Ejecutar el método de autenticación
        Usuario result = instance.authenticate(email, psw, "s");
        int rolRecibido = Integer.parseInt(result.getRol().getId().toString());
        // Comparar el resultado esperado con el resultado obtenido
        assertEquals("El resultado de la autenticación no es el esperado.", rolExperado, rolRecibido);

        System.out.println("Prueba de autenticación completada.");
    }

    //TEST 2
    //@Test
    public void testCrearUsuario() {
        System.out.println("Iniciando prueba de inserción de usuario...");

        String dni = "55552128";
        String nombres = "Kelvin Trucho";
        String correo = "kelvin.lucana@gmail.com";
        String contra = "Abcd1234$";
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

    //TEST 3
    //@Test
    public void testEditarUsuario() {
        System.out.println("Iniciando prueba de edición de datos de usuario...");

        // Datos de prueba para el usuario
        int id = 4;
        String dni = "55552142";
        String nombres = "Kelvin Lucario";
        String apePaterno = "Vasquez";
        String apeMaterno = "Fuentes";
        String correo = "kelvin.lucario@gmail.com";
        String contra = "Abcd12345%";
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

    //TEST 4
    //@Test
    public void testCrearCategoria() {
        String descripcion = "Ultimo en tendencias de almohadas";
        String nombre = "almohadas";

        CategoriaDAO instance = new CategoriaDAO();

        int expected = 1;

        int actual = instance.createCategory(nombre, descripcion, "1");

        System.out.println("Expected number of rows inserted: " + expected);
        System.out.println("Actual number of rows inserted: " + actual);

        assertEquals("El número de filas insertadas no es el esperado.", expected, actual);

        Categoria catCreado = instance.getCategoryByName(nombre);
        if (catCreado != null) {
            System.out.println("Categoria creada correctamente.");
            System.out.println("Nombre de categoria creada: " + catCreado.getNombre());
        } else {
            System.out.println("Categoria no encontrada.");
        }
    }

    // @Test
    public void testObtenerUsuarioByDNI() {
        System.out.println("Iniciando test: Obtener usuario por su DNI");

        String dni = "12345678";
        UsuarioDAO instance = new UsuarioDAO();

        // Esperado
        String expResultDni = "12345678";
        System.out.println("Número esperado de usuarios: " + expResultDni);
        System.out.println("Usuarios obtenidos:");

        // Obtener usuario
        Usuario usr = instance.getUserByDni(dni);

        if (usr != null) {
            // Imprimir datos del usuario obtenido
            System.out.println("Detalles del usuario obtenido:");
            System.out.println("DNI: " + usr.getDni());
            System.out.println("Nombres: " + usr.getNombres());
            System.out.println("Apellido Paterno: " + usr.getApePaterno());
            System.out.println("Apellido Materno: " + usr.getApeMaterno());
            System.out.println("Correo: " + usr.getCorreo());
            System.out.println("Teléfono: " + usr.getTelefono());
        } else {
            System.out.println("No se encontró un usuario con el DNI proporcionado.");
        }

        // Verificar el resultado
        String resultDni = (usr != null) ? usr.getDni() : null;
        assertEquals(expResultDni, resultDni);

        System.out.println("Test finalizado.");
    }

}
