object almacen {
    const property cosas = #{}
    var property maximoDeBultos = 3

    method agregar(cosa) {
        cosas.add(cosa)
    }

    method descargarDeCamion(_cosas) {
        cosas.addAll(_cosas)
    }

    method puedeDescargar(camion) {
        return self.cantBultos() + camion.totalBultos() <= maximoDeBultos
    }

    method cantBultos() {
		return cosas.sum({cosa => cosa.bulto()})
	}

    method validarTransporte(camion) {
        if (not self.puedeDescargar(camion)) {
            self.error("No puede descargarse el camión en el destino. Superaría el máximo de bultos de " + maximoDeBultos)
        }
    }
}