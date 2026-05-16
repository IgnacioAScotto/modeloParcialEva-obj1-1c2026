import evas.*
import nerv.*


object asuka {
    var puntosDeEntrenamiento = 5
    var ultimoEvaSincronizado = eva00

    method efectoDeSincroCon(eva) {
        ultimoEvaSincronizado = eva
        puntosDeEntrenamiento += eva.puntosQueOtorga()
    }

    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)

    method estaSatisfecha() = ultimoEvaSincronizado.campoAt() > 2115
}

object shinji {
    var puntosDeEntrenamiento = 2
    var estaCansado = false
    const evasSincronizados = []

    method efectoDeSincroCon(eva) {
        puntosDeEntrenamiento += eva.puntosQueOtorga()
        estaCansado = true
        evasSincronizados.add(eva)
    }

    method descansar() {
        estaCansado = false
    }

    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and !estaCansado

    method estaSatisfecha() = nerv.evas().all({e => evasSincronizados.contains(e)})
}

object rei {
    var puntosDeEntrenamiento = 0
    var cantidadSincros = 0
    

    method efectoDeSincroCon(eva) {
        puntosDeEntrenamiento += eva.puntosQueOtorga()
        cantidadSincros += 1
    }

    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and eva.campoAt() >= 2110 and cantidadSincros < 5

    method estaSatisfecha() = cantidadSincros > 0
}