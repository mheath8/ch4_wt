# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
end
  private

    def movie_params
        params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
    # in app/controllers/movies_controller.rb
 
def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique ID
  # will render app/views/movies/show.html.haml by default
end
def new
  # default: render 'new' template
end
# in movies_controller.rb
def create
  #@movie = Movie.create!(params[:movie])
  @movie = Movie.create!(movie_params) #new array
  flash[:notice] = "#{@movie.title} was successfully created."
  redirect_to movies_path
end