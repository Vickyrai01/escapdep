class Escapista{

    var maestria
    const salasCompletadas = []
    var saldo

    method puedeSalirDe(unaSala) = maestria.puedeSalirDe(unaSala, self)

    method hizoMuchasSalas() = salasCompletadas.size() >= 6

    method subirDeMaestria() {
        if(self.hizoMuchasSalas())
            maestria.subirDeMaestria(self)
    }

    method mestria(unaMaestria) {
        maestria = unaMaestria
    }

    method nombreDeSalasDondeSalio() = salasCompletadas.map({unaSala => unaSala.nombre()}).asSet()
    
    method escaparDe(unaSala) = salasCompletadas.add(unaSala)

    method puedePagar(unaCantidad) = saldo >= unaCantidad 

    method saldo() = saldo

    method descontar(unaCantidad) {saldo =- unaCantidad}
}
