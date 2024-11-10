class Grupo {

    const escapistas = #{}

    method puedeSalirDe(unaSala) = escapistas.any({unEscapista => unEscapista.puedeSalirDe(unaSala)}) 

    method escaparDe(unaSala) {
      self.pagar(unaSala)
      escapistas.forEach({unEscapista => unEscapista.escaparDe(unaSala)})
    }

    method pagar(unaSala) {
        if(!self.puedenPagar(unaSala)){
            throw new NoPuedenPagarLaSalaException(message = "El grupo no tiene el dinero suficiente para pagar la sala")
        }
        escapistas.forEach({unEscapista => unEscapista.descontar(self.precioPorPersona(unaSala))})
    }

    method precioPorPersona(unaSala) = unaSala.precio().div(escapistas.size())

    method puedenPagar(unaSala) = self.todosPuedenPagar(unaSala) || self.losQueMasTienenPuedenPagar(unaSala)

    method todosPuedenPagar(unaSala) = escapistas.all({unEscapista => unEscapista.puedePagar(self.precioPorPersona(unaSala))})

    method losQueMasTienenPuedenPagar(unaSala) = self.saldoDeEscapistasConPlataPara(unaSala)  >= unaSala.precio()

    method saldoDeEscapistasConPlataPara(unaSala) = self.escapistasQuePuedenPagar(unaSala).sum({unEscapista => unEscapista.saldo()})

    method escapistasQuePuedenPagar(unaSala) = escapistas.filter({unEscapista => unEscapista.puedenPagar(self.precioPorPersona(unaSala))})
}

class NoPuedenPagarLaSalaException inherits Exception{}