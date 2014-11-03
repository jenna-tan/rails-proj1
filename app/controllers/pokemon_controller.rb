class PokemonController < ApplicationController

  def capture
  	@pokemon.trainer_id = current_trainer.id
  	if @pokemon.save
  		redirect_to root_path
  	end
  end

  def damage
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.health -= 10
  	if @pokemon.health <= 0
  		@pokemon.destroy
  		redirect_to trainer_path(@pokemon.trainer_id)
  	elsif @pokemon.save
  		redirect_to trainer_path(@pokemon.trainer_id)
  	end
  end

  def new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
  	@pokemon.health = 100
  	@pokemon.level = 1
  	@pokemon.trainer_id = current_trainer.id
  	if @pokemon.save
  		redirect_to trainer_path(@pokemon.trainer_id)
  	else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to new_path
    end
  end



  private
  def pokemon_params
  	params.require(:pokemon).permit(:name)
  end

end