object ruta9 {
    method soportaViaje(camion) {
        return camion.puedeCircularEnRuta(11)
    }

    method validarTransporte(camion) {
        if (not self.soportaViaje(camion)) {
            self.error("El camino no soporta el viaje.")
        }
    }
}

object caminosVecinales {
    var property pesoMaxSoportado = 2500

    method soportaViaje(camion) {
        return camion.pesoTotal() <= pesoMaxSoportado
    }

    method validarTransporte(camion) {
        if (not self.soportaViaje(camion)) {
            self.error("El camino no soporta el viaje.")
        }
    }
}