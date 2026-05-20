object nerv {
    const pilotos = []
    const property evas = []

    method registrarPiloto(piloto) {
        pilotos.add(piloto)
    }
    method eliminarPiloto(piloto) {
        pilotos.remove(piloto)
    }
    method registrarPilotos(variosPilotos) {
        pilotos.addAll(variosPilotos)
    }
    method eliminarTodosLosPilotos() {
        pilotos.clear()
    }

    method registrarEva(eva) {
        evas.add(eva)
    }
    method eliminarEva(eva) {
        evas.remove(eva)
    }
    method registrarEvas(variosEvas) {
        evas.addAll(variosEvas)
    }
    method eliminarTodosLosEvas() {
        evas.clear()
    }

    method sincronizarEvaConPiloto(eva, piloto) {
        if(piloto.puedeSincronizarCon(eva) and eva.puedeSincronizarCon(piloto)){
            eva.consecuenciaDeSincronizacion()
            piloto.consecuenciaDeSincronizacion(eva)
        }
    }

    method sincronizarConTodosLosEvas(piloto) {
        evas.forEach({e => self.sincronizarEvaConPiloto(e, piloto)})
    }

    method promedioDePuntosPilotos() = pilotos.sum({p => p.puntosDeEntrenamineto()}) / pilotos.size()

    method pilotoConMayorPuntos() = pilotos.max({p => p.puntosDeEntrenamiento()})

    method valoresAt() = evas.map({e => e.campoAt()})

    method evasQuePuedenSincronizarseCon(piloto) = evas.filter({e => e.puedeSincronizarCon(piloto)})

    method todosLosPilotosConUnEva() = pilotos.all({p => self.evasQuePuedenSincronizarseCon(p).notEmpty()})

    method estaSatisfecho(piloto) = piloto.estaSatisfecha() 

    method puedeSerSincronizadoConAlgunPiloto(eva) = pilotos.any({p => eva.puedeSincronizarCon(p)})

    method evasQueSeSincronizanCon() = evas.all({e => self.puedeSerSincronizadoConAlgunPiloto(e)})
}