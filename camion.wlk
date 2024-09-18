import cosas.*

object camion {

	const property cosas = #{}
		
	method cargar(cosa) {
		cosas.add(cosa)
		cosas.forEach({cosa => cosa.reaccionarACarga()})
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal() {
		return 1000 + self.pesoDeCarga()
	}

	method pesoDeCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivel() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({carga => carga.nivel() > cosa.nivel()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and not self.hayObjetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad)
	}

	method hayObjetosQueSuperanPeligrosidad(nivel) {
		return self.objetosQueSuperanPeligrosidad(nivel).size() > 0
	}

	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso().between(min, max)})
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bulto()})
	}
}
