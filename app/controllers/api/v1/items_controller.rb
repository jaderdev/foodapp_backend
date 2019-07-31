class Api::V1::ItemsController < ApplicationController
	
	def index
		items = nil
		
		if(params["restaurante_id"].present?)
			items = Restaurante.find(params["restaurante_id"]).item
		end
		
		if(params["pedido_id"].present?)
			items = Pedido.find(params["pedido_id"]).item
		end

		if(!params["pedido_id"].present? && !params["restaurante_id"].present?)
			items = Item.all
		end

		render json: {status: 'SUCCESS', message:'Itens carregados', data:items},status: :ok
		
	end

	def show
		item = Item.find(params[:id])
		render json: {status: 'SUCCESS', message:'Loaded item', data:item},status: :ok
	end

	# Criar um novo artigo
	def create
		item = Item.new(item_params)

		if item.save
			render json: {status: 'SUCCESS', message:'Saved item', data:item},status: :ok
		else
			render json: {status: 'ERROR', message:'items not saved', data: item.errors},status: :precondition_failed
		end
	end
	# Excluir artigo
	def destroy
		item = Item.find(params[:id])
		item.destroy
		render json: {status: 'SUCCESS', message:'Deleted item', data:item},status: :ok
	end
 
	# Atualizar um artigo
	def update
		item = Item.find(params[:id])
		if item.update_attributes(item_params)
			render json: {status: 'SUCCESS', message:'Updated item', data:item},status: :ok
		else
			render json: {status: 'ERROR', message:'items not update', data:item.errors},status: :unprocessable_entity
		end
	end
	# Parametros aceitos
	private
	def item_params
		params.permit(  :nome,
						:descricao,
						:ingredientes,
						:restaurante)
	end
end