import sala.Sala

class SalaHistoria inherits Sala{

    const estaBasadaEnHechosReales

    override method precioSegunGenero() = dificultad * 0.314


    override method esSalaDificil() = super() + !estaBasadaEnHechosReales
}
