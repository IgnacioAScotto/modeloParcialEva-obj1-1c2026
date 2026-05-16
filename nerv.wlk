object nerv {
    const property evas = []
    const pilotos = []

    method registrarPiloto(piloto) {
        pilotos.add(piloto)
    }
    method registrarEva(eva) {
        evas.add(eva)
    }

    method registrarPilotos(piloto) {
        pilotos.adAll(piloto)
    }
    method registrarEvas(eva){
        evas.adAll(eva)
    }

    method echarPiloto(piloto) {
        pilotos.remove(piloto)
    }
    method echarEva(eva) {
        evas.remove(eva)
    }

    method echarPilotos(piloto) {
        piloto.removeAll(piloto)
    }
    method echarEvas(eva){
        evas.removeAll(eva)
    }

    method intentarSincro(eva, piloto){
        if (self.puedenSincronizar(eva, piloto)) {
            eva.efectoDeSincroCon(piloto)
            piloto.efectoDeSincroCon(eva)
        }
    }

    method puedenSincronizar(eva, piloto) = eva.puedeSincronizarCon(piloto) and piloto.puedeSincronizarCon(eva) 
}