import cosas.*
import caminos.*
import destinos.*

class Camion {

	const property cosas = #{}
	const tara = 1000
	const pesoMaximo = 2500
		
	method cargar(cosa) {
		cosas.add(cosa)
		cosa.reaccionarACarga()
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
		return tara + self.pesoDeCarga()
	}

	method pesoDeCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and not self.hayObjetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad)
	}

	method hayObjetosQueSuperanPeligrosidad(nivel) {
		return not self.objetosQueSuperanPeligrosidad(nivel).isEmpty()
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

	method transportar(destino, camino) {
		self.validarTransporte(destino,camino)
		destino.descargarDeCamion(cosas)
		cosas.clear()
	}

	method validarTransporte(destino, camino) {
		self.validarPeso()
		camino.validarTransporte(self)
		destino.validarTransporte(self)
	}

	method validarPeso() {
		return if (self.excedidoDePeso()) 
			self.error("No se puede transportar el camión por exceso de peso (" + self.pesoTotal() + "kg.)")
	}
}
