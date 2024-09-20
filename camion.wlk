import cosas.*
import caminos.*
import destinos.*

object camion {

	const property cosas = #{}
		
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
		return 1000 + self.pesoDeCarga()
	}

	method pesoDeCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({carga => carga.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
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

	method transportar(destino, camino) {
		self.validarTransporte(destino,camino)
		destino.descargarDeCamion(cosas)
		cosas.clear()
	}

	method validarTransporte(destino, camino) {
		self.validarPeso()
		self.validarCamino(camino)
		self.validarDestino(destino)
	}

	method validarPeso() {
		return if (self.excedidoDePeso()) 
			self.error("No se puede transportar el camión por exceso de peso (" + self.pesoTotal() + "kg.)")
	}

	method validarCamino(camino) {
		return if (not camino.soportaViaje(self)) 
			self.error("El camino no soporta el viaje.")
	}

	method validarDestino(destino) {
		return if (not destino.puedeDescargar(self)) 
			self.error("No puede descargarse el camión en el destino.")
	}
}
