/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package utilidades;

import java.sql.Connection;
import java.sql.Statement;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Chavez
 */
public class ConexionTest {

    public ConexionTest() {
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

    //@Test
    public void testPruebaConexion() throws Exception {
        System.out.println("Iniciando test: testPruebaConexion");
        instance = new Conexion();
        // Act: Intentar conectar
        cn = instance.conecta();

        // Assert: Verificar que la conexión no es nula
        assertNotNull("La conexión debería estar establecida correctamente.", cn);

        // Verificar si la conexión está activa (no es nula y no está cerrada)
        int valorConexion = instance.verificarConexion(cn);
        assertEquals("La esta abierta correctamente.", 1, valorConexion);

        // Cerrar recursos
        instance.closeResources(cn);
        System.out.println("Recursos cerrados correctamente.");
    }

}
