import evas.*
import nerv.*
object asuka {
    var puntosDeEntrenamineto = 5
    var ultimoEvaSincronizado = eva01

    method puntosDeEntrenamineto() = puntosDeEntrenamineto
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)
    method estaSatisfecha() = self.ultimoEvaSincronizado().campoAt() > 2115
    method ultimoEvaSincronizado() = ultimoEvaSincronizado 

    method consecuenciaDeSincronizacion(eva) {
        ultimoEvaSincronizado = eva
        puntosDeEntrenamineto += eva.puntosQueOtorga()
    }
}

object shinji {
    var puntosDeEntrenamineto = 2
    var estaDescansado = true
    var ultimoEvaSincronizado = eva01
    const evasSincronizados = []

    method puntosDeEntrenamineto() = puntosDeEntrenamineto
    method estaDescansado() = estaDescansado 
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and self.estaDescansado()
    method ultimoEvaSincronizado() = ultimoEvaSincronizado 

    method consecuenciaDeSincronizacion(eva) {
        ultimoEvaSincronizado = eva
        puntosDeEntrenamineto += eva.puntosQueOtorga()
        estaDescansado = false
        self.agregarEvaSincronizado()
    }

    method descansar() {
        estaDescansado = true
    }

    method agregarEvaSincronizado() {
        evasSincronizados.add(self.ultimoEvaSincronizado())
    }

    method estaSatisfecha() = nerv.evas().all({e => evasSincronizados.contains(e)})
}

object rei {
    var puntosDeEntrenamineto = 0
    var sincronizaciones = 0
    var ultimoEvaSincronizado = eva01

    method puntosDeEntrenamineto() = puntosDeEntrenamineto
    method sincronizaciones() =  sincronizaciones
    method ultimoEvaSincronizado() = ultimoEvaSincronizado 


    method consecuenciaDeSincronizacion(eva) {
        ultimoEvaSincronizado = eva
        puntosDeEntrenamineto += eva.puntosQueOtorga()
        sincronizaciones += 1
    }

    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and eva.campoAt() >= 2110 and self.sincronizaciones() < 5
    method estaSatisfecha() = self.sincronizaciones() > 0
}