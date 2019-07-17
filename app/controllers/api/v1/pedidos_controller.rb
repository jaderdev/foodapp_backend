class Api::V1::PedidosController < ApplicationController

	def index 
		pedidos = Pedido.order('created_at ASC');
		render json: {status: 'SUCCESS', message:'Pedidos existentes', data:pedidos }, status: :ok
	end

end
