import profesional.profesional
object amateur {

    method puedeSalirDe(unaSala, unEscapista) = !unaSala.esSalaDificil() && unEscapista.hizoMuchasSalas()
    method subirDeMaestria(unEscapista) = unEscapista.maestria(profesional)
}