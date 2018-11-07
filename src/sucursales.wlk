import remeras.*

class Comercio{
	var property sucursales

	method totalFacturadoEnTodasLasSucursales(){
		sucursales.sum{sucursal => sucursal.totalFacturado() }
	}

	method pedidoMasCaro(){
		sucursales.max{sucursal => sucursal.pedidoDeSucursalMasCaro()}
	}
	
	method todosLosPedidosDeUnSoloColor(color){
		sucursales.count{sucursal => sucursal.pedidosDeUnSoloColor(color)
	}

}
}

class Sucursales{
	var property pedidos
	var property cantidadMinimaDeRemeras
	
	method precioDePedidoBase(pedido){
		return pedido.cantidad() * pedido.modeloDeRemera().costoDeRemera() 
	}
	
	method precioDePedidoConDescuento(pedido){
		return self.precioDePedidoBase(pedido) - 
			(self.precioDePedidoBase(pedido) * pedido.modeloDeRemera().porcentajeDeDescuento() / 100)
	}
	
	
	method precioDePedido(pedido){
		if (pedido.cantidad()>=	self.cantidadMinimaDeRemeras()) return self.precioDePedidoConDescuento(pedido)
		else return self.precioDePedidoBase(pedido)
	}


	method registrarNuevoPedido(pedido){
		pedidos.add(pedido)
	}

	
	method totalFacturado(){
		return pedidos.sum{pedido => self.precioDePedido(pedido)}
	}
	
	
	method pedidosDeUnSoloColor(color){
		pedidos.count{pedido => pedido.modeloDeRemera().color(color) == color	}
	}
	
	
	method pedidoDeSucursalMasCaro(){
		return pedidos.max{pedido => self.precioDePedido(pedido)}
	}



}
	
class Pedido {
	var property modeloDeRemera
	var property cantidad
}	



