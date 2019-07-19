class Api::V1::PedidosController < ApplicationController

	def index 
		pedidos = Pedido.order('created_at ASC');
		render json: {status: 'SUCCESS', message:'Pedidos existentes', data:pedidos }, status: :ok
	end

	def show
		pedido = Pedido.find(params[:id])
		render json: {status: 'SUCCESS', message:'Loaded pedido', data:pedido},status: :ok
	end

	def update
		pedido = Pedido.find(params[:id])
		if pedido.update_attributes(pedido_params)
			render json: {status: 'SUCCESS', message:'Updated pedido', data:pedido},status: :ok
		else
			render json: {status: 'ERROR', message:'pedidos not update', data:pedido.errors},status: :unprocessable_entity
		end
	end

	def destroy
		pedido = Pedido.find(params[:id])
		pedido.destroy
		render json: {status: 'SUCCESS', message:'Deleted pedido', data: pedido},status: :ok
	end

	private
	def pedido_params
		params.permit(  :restaurante,
						:status_pedido)
	end

end
