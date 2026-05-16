


object eva01 {
    var campoAt = 2110
    var energia = 100

    method campoAt() = campoAt 

    method efectoDeSincroCon(piloto){
        energia -= 25
        campoAt = 1250.min(campoAt+1)
    }

    method recargarEnergia(horas){
        100.min(energia + 30 * horas)
    }

    method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamiento() >= 4 and energia > 30
    method puntosQueOtorga() = 2
}

object eva02 {
    var energia = 100
    var modo = estandar

    method campoAt() = 2114
    method efectoDeSincroCon(piloto){
        energia -= modo.consumo()
        //energia -= 0.max(energia-modo.consumo()) -> para que no baje de 0
    }

    method recargarEnergia(horas){
        100.min(energia + 25 * horas)
    }

    method cambiarModo(nuevoModo){
        modo = nuevoModo
    }

    method puedeSincronizarCon(piloto) = piloto.puntosDeEntrenamiento() >= 2 and energia > 20
    method puntosQueOtorga() = modo.puntosQueOtorga()
}

//Modos de Eva 02

object estandar {
    method comsumo() = 10
    method puntosQueOtorga() = 1
}

object ataque {
    method comsumo() = 20
    method puntosQueOtorga() = 3
}

object berserk {
    method comsumo() = 35
    method puntosQueOtorga() = 6
}

object eva00 {
    var campoAt = 2110

    method campoAt() = campoAt
    //Fuerza debe ser >= 0
    method mejorarCampoAt(fuerza){
        campoAt= 2150.min(campoAt + fuerza)
    }
    method efectoDeSincroCon(piloto){ }

    method puedeSincronizarCon(piloto) = true
    method puntosQueOtorga() = 1
}