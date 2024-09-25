object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() { return 1 }
	method reaccionarACarga() {  }
}

object bumblebee {
	var property estado = auto
	method peso() { return 800 }
	method nivelPeligrosidad() { return estado.nivelPeligrosidad() }
	method bulto() { return 2 }
	method reaccionarACarga() { estado = robot }
}

object robot {
	method nivelPeligrosidad() { return 30 }
}

object auto {
	method nivelPeligrosidad() { return 15 }
}

object paqueteLadrillos {
	var property cantLadrillos = 100
	method peso() { return cantLadrillos * 2 }
	method nivelPeligrosidad() { return 2 }
	method bulto() {
		return if (cantLadrillos <= 100) 1
				else if (cantLadrillos <= 300) 2
					else 3 
	}
	method reaccionarACarga() { cantLadrillos += 12 }
}

object arenaAGranel {
	var property peso = 20
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1 }
	method reaccionarACarga() { peso += 20 }
}

object bateriaAntiaerea {
	var property tieneMisiles = false
	method peso() { return if (tieneMisiles) 300 else 200 }
	method nivelPeligrosidad() { return if (tieneMisiles) 100 else 0 }
	method bulto() { return if (tieneMisiles) 2 else 1 }
	method reaccionarACarga() { tieneMisiles = true }
}

object contenedor {
	
	const property cosas = #{}

	method agregar(cosa) {
		cosas.add(cosa)
	}

	method peso() { 
		return 100 + self.pesoDeCosas() 
	}

	method pesoDeCosas() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		return if (cosas.isEmpty()) 0 else self.nivelDeObjetoMasPeligroso()
	}

	method nivelDeObjetoMasPeligroso() {
		return cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
	}

	method bulto() { 
		return 1 + self.bultosDeCosas()
	}

	method bultosDeCosas() {
		return cosas.sum({cosa => cosa.bulto()})
	}

	method reaccionarACarga() {
		cosas.forEach({cosa => cosa.reaccionarACarga()})
	}
}

object residuosRadiactivos {
	var property peso = 50
	method nivelPeligrosidad() { return 200 }
	method bulto() { return 1 }
	method reaccionarACarga() { peso += 15 }
}

class EmbalajeSeguridad {
	var property cosaQueEnvuelve
	method peso() { return cosaQueEnvuelve.peso() }
	method nivelPeligrosidad() { return cosaQueEnvuelve.nivelPeligrosidad() / 2 }
	method bulto() { return 2 }
	method reaccionarACarga() {  }
}