class ActorsController < ApplicationController

  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    Actor.create(actor_params)
    redirect_to actors_path

  end

  private

  def actor_params
    params.require(:actor).permit(:name)
  end

end
