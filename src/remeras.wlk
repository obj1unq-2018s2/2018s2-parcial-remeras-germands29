
class RemeraLisa{
	var property talle    
	var property color
	
	
	
	method costoDeRemeraPorTalle(){
		if (self.talle().between(32,40)) return 80
		else return 100
	}
	
	method esDeColorBasico(){
		return self.color() == "Blanco" or self.color() == "Negro" or self.color() == "Gris"
	}
	
	
	method costoDeRemera(){
		if (self.esDeColorBasico())	 return 	self.costoDeRemeraPorTalle()
		else 	return self.costoDeRemeraPorTalle()* 0.10
	}
	
	
	method porcentajeDeDescuento(){
		return 10
	}
}


class RemeraBordada inherits RemeraLisa{
	var property cantidadDeColores
	
	override method costoDeRemera(){
		if (self.cantidadDeColores() == 1)  return   super() + 20
		else 	return  (self.cantidadDeColores() * 10) + super()
	}
	
	override method porcentajeDeDescuento(){
		return 2
	}
	
}



class RemeraSublimada inherits RemeraLisa{
	var property altoDelDibujo
	var property anchoDelDibujo
	var property tieneDerechos
	var property costoDeLosDerechos
	
	method superficieDeSublimado(){
		return self.altoDelDibujo() * self.anchoDelDibujo() 	
	}
	
	method costoDelSublimado(){
		return self.superficieDeSublimado() * 0.5
	}
	
	override method costoDeRemera(){
		if(self.tieneDerechos()) return self.costoDelSublimado() + super() + self.costoDeLosDerechos()	
		else return self.costoDelSublimado() + super()

	}	
	
	override method porcentajeDeDescuento(){
		if (self.tieneDerechos()) return 20
		else return super()
		
	}

}









