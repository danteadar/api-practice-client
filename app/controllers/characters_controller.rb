class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    id = params[:id]
    @character = Character.find(id)
  end

  def new
    render :new
  end

  def create
    @character = Unirest.post("http://localhost:3000/api/v1/characters",
      :parameters => {character_name: params[:character_name],
        location: params[:location],
        quote: params[:quote]}).body
    redirect_to characters_path(@character['id'])
  end

  def update
    
  end

  def destroy
    @id = params[:id]
    @character = Character.find(id)
    @character.destroy
    redirect_to characters_path
  end
end
