import sala.Sala
class SalaTerror inherits Sala{

    const cantSustos

    method sonSuficientesSustos() = cantSustos > 5

    override method precioSegunGenero(){
        var precio = 0
        if(self.sonSuficientesSustos()){
            precio = cantSustos * 0.20
        }
        return precio
    }

    override method esSalaDificil() = super() || self.sonSuficientesSustos() 
}