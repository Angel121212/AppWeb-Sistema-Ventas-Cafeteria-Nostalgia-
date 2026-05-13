    package com.example.demo.compra;

    import org.springframework.jdbc.core.JdbcTemplate;
    import org.springframework.stereotype.Repository;

    import com.example.demo.usuario.Usuario;

    import org.springframework.jdbc.core.RowMapper;
    import org.springframework.jdbc.support.GeneratedKeyHolder;
    import org.springframework.jdbc.support.KeyHolder;
    import java.sql.Statement;


    import java.sql.PreparedStatement;
    import java.util.List;

    @Repository
    public class CompraRepository implements CompraDAO{

        private final JdbcTemplate jdbcTemplate;

        public CompraRepository(JdbcTemplate jdbcTemplate){
            this.jdbcTemplate = jdbcTemplate;
        }

        private final RowMapper<Compra> compraRowMapper = (rs, rowNum) -> {
            Compra compra = new Compra();
            compra.setId(rs.getInt("id"));

            Usuario u = new Usuario();
            u.setId(rs.getInt("usuario_id"));
            u.setNombre(rs.getString("usuario_nombre")); //llama al nombre del cliente
            compra.setUsuario(u);
            compra.setFechaCreacion(rs.getDate("fechaCreacion") != null 
                ? rs.getDate("fechaCreacion").toLocalDate() 
                : null);
            compra.setPago(rs.getString("pago"));
            compra.setTotal(rs.getDouble("total"));
            return compra;
        };

        @Override
        public Compra crearCompra(Compra compra){
            String sql = "INSERT INTO Compra (usuario_id, fechaCreacion, pago, total) VALUES (?, ?, ?, ?)";

            KeyHolder keyHolder = new GeneratedKeyHolder();

            jdbcTemplate.update(connection -> {
                PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, compra.getUsuario().getId());
                ps.setDate(2, java.sql.Date.valueOf(compra.getFechaCreacion()));
                ps.setString(3, compra.getPago());
                ps.setDouble(4, compra.getTotal());
                return ps;
            }, keyHolder);

            compra.setId(keyHolder.getKey().intValue()); // aqui se genera la compra_id 

            return compra;
        }
        
        @Override
        public List<Compra> listaCompra(){
            String sql = "SELECT c.*, u.nombre as usuario_nombre FROM Compra c "+
                        "INNER JOIN Usuario u ON c.usuario_id=u.id";
            return jdbcTemplate.query(sql, compraRowMapper);
        }
    }


