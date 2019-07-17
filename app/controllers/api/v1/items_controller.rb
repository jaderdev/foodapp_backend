class Api::V1::ItemsController < ApplicationController
	def index 
		items = Item.order('created_at DESC');
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
						:ingredientes)
	end
end

#momento unico na minha infancia
#Viví em um lugar distante e nas sombras de uma floresta densa e escura no sul
#com minha mãe, viviamos escondidos pois meu pai era um criminoso procurado. E nas terras
#onde moravamos a vingaça sempre envolve a família. Cresci fugindo e me escondendo. Resolvi buscar
# uma nova realidade quando minha mãe desapareceu. Eu tinha amigos em minha vila mas quando pessoas procurando
#se vingar do meu pai nos encontraram começamos a fugir eu tinha 4 anos. Minha mãe morreu há 3 anos.
#minha mãe era muito bonita e sempre amei-a muito.

#clã: Nosferato

#Primeiro contato com o sobrenatural
#O Oculto sempre existiu, a floresta onde nos escodíamos era muito mágica e as entidades sempre estavam presentes.
#Ví um vampiro a distância, ele fugia de uma luz no meio da floresta. De repente um vulto negro me envolveu e eu acordei
#com um sede de sangue estranha e a partir desse dia passei a sugar sangue de animais, nunca entendi por que mais foi assim.

# Quem foi meu senhor?
#não sei quem é

#não fui apresentado ao príncipe
#nunca conheci meu grupo

#me alimento com sangue de animal

#busco encontrar minha mãe e o vampiro que fugia

