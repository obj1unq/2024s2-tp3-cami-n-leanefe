object ruta9 {
    method soportaViaje(camion) {
        return camion.puedeCircularEnRuta(11)
    }
}

object caminosVecinales {
    var property pesoMaxSoportado = 2500

    method soportaViaje(camion) {
        return camion.pesoTotal() <= pesoMaxSoportado
    }
}