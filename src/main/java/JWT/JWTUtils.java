package JWT;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.security.Key;
import java.util.Date;

public class JWTUtils {

    // Clave secreta (debe ser larga y segura; evita ponerla en el código fuente directamente)
    private static final Key SECRET_KEY = Keys.secretKeyFor(SignatureAlgorithm.HS256); // Puedes cargarla desde una configuración segura
    private static final long EXPIRATION_TIME = 86400000; // 1 día en milisegundos

    /**
     * Genera un token JWT para un usuario específico
     *
     * @param correo El correo del usuario
     * @return Un token JWT
     */
    public static String generateToken(String correo) {
        return Jwts.builder()
                .setSubject(correo)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SECRET_KEY)
                .compact();
    }

    /**
     * Valida un token JWT y verifica su firma y fecha de expiración
     *
     * @param token El token JWT a validar
     * @return true si el token es válido, false en caso contrario
     */
    public static boolean validateToken(String token) {
        try {
            Jwts.parserBuilder().setSigningKey(SECRET_KEY).build().parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            System.out.println("Token no válido: " + e.getMessage());
            return false;
        }
    }

    /**
     * Extrae el correo (subject) del token JWT
     *
     * @param token El token JWT
     * @return El correo del usuario
     */
    public static String extractCorreo(String token) {
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(SECRET_KEY)
                .build()
                .parseClaimsJws(token)
                .getBody();
        return claims.getSubject();
    }
}
