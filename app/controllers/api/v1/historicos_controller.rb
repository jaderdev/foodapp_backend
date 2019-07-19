class Api::V1::HistoricosController < ApplicationController
	def index 
		pedido = Pedido.find(params["pedido_id"]);
		historico = pedido.historico
		render json: {status: 'SUCCESS', message:'Históricos do pedido', data:historico},status: :ok
	end
end
