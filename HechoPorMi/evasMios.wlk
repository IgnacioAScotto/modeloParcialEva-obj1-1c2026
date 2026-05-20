object eva01 {
    var campoAt = 2110
    var energia = 100

    method energia() = energia
    method campoAt() = campoAt 
    method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamineto() >= 4 and energia > 30 
    method puntosQueOtorga() = 2
    
    method consecuenciaDeSincronizacion() {
        energia -= 25
        campoAt = 2150.min(campoAt+1)
    }
    
    method recargarEnergia(horas) {
        energia = 100.min(30*horas)
    }
}

object eva02 {
    var energia = 100
    var modo = ataque 

    method modo() = modo
    method campoAt() = 2114
    method energia() = energia
    method puntosQueOtorga() = modo.puntosQueOtorga()

    method cambiarModo(nuevoModo) {
        modo = nuevoModo
    }

    method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamineto() >= 2 and energia > 20

    method consecuenciaDeSincronizacion() {
        energia -= modo.energiaConsumida()
    }

    method recargarEnergia(horas) {
        energia = 100.min(25*horas)
    }
}

//Modos de combates de eva 02
object estandar {
    method puntosQueOtorga() =  1
    method energiaConsumida() = 10 
}

object ataque {
    method puntosQueOtorga() =  3
    method energiaConsumida() = 20 
}

object berserk {
    method puntosQueOtorga() =  6
    method energiaConsumida() = 35
}

object eva00 {
    var campoAt = 2100

    method campoAt() = campoAt
    method puedeSincronizarCon(piloto) = true
    method puntosQueOtorga() = 1 

    method mejorarCampoAt(valor) {
        campoAt = 2150.min(campoAt + valor)
    }

    method consecuenciaDeSincronizacion() { }
}