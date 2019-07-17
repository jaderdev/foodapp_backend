class Api::V1::RestaurantesController < ApplicationController
	def index 
		restaurantes = Restaurante.order('created_at DESC');
		render json: {status: 'SUCCESS', message:'Itens carregados', data:restaurantes},status: :ok
	end

	def show
		restaurante = Restaurante.find(params[:id])
		render json: {status: 'SUCCESS', message:'Loaded restaurantes', data:restaurante},status: :ok
	end

	# Criar um novo artigo
	def create
		restaurante = Restaurante.new(restaurante_params)
		if restaurante.save
			render json: {status: 'SUCCESS', message:'Saved restaurante', data:restaurante},status: :ok
		else
			render json: {status: 'ERROR', message:'restaurantes not saved', data: restaurante.errors},status: :precondition_failed
		end
	end
	# Excluir artigo
	def destroy
		restaurante = Restaurante.find(params[:id])
		restaurante.destroy
		render json: {status: 'SUCCESS', message:'Deleted restaurante', data:restaurante},status: :ok
	end
 
	# Atualizar um artigo
	def update
		restaurante = Restaurante.find(params[:id])
		if restaurante.update_attributes(restaurante_params)
			render json: {status: 'SUCCESS', message:'Updated restaurante', data:restaurante},status: :ok
		else
			render json: {status: 'ERROR', message:'restaurantes not update', data:restaurante.errors},status: :unprocessable_entity
		end
	end
	# Parametros aceitos
	private
	def restaurante_params
		params.permit(  :nome,
						:descricao,
						:nome_fantasia,
						:cnpj,
						:hora_abertura,
						:hora_fechamento)
	end
end
