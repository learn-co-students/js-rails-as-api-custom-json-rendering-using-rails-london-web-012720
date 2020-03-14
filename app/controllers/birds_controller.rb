class BirdsController < ApplicationController
  
  # in this way we can access multiple array in a object and request to send specif data info and exclude others
  # the two ways achive the same result, one include and one exclude but the outcome is the same
  def index
    birds = Bird.all
     render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
  end

  # we can send just the info we need to use in the below example 
  # we can see two method, the manual and the slice method in practice 
  def show 
    bird = Bird.find(params[:id])
    if bird 
    render json: bird.slice(:id, :name, :species)
    else 
    render json: {message: "Bird not found"}
    end
    # {id: bird.id, name: bird.name, species: bird.species}
  end
end