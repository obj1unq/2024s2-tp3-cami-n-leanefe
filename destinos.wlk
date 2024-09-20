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
}