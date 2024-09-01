class GenresController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  before_action :set_genre, except: [:index, :new, :create]

  def index
    @genres = Genre.all      
  end

  def show
    @movies = @genre.movies
  end
  

  def new
    @genre = Genre.new     
  end

  def create
    @genre = Genre.new(genre_params)      
    if @genre.save
      redirect_to @genre, notice: "Genre created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to @genre, notice: "Genre updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path, notice: "Genre deleted successfully!"
  end

  private

  def set_genre
    @genre = Genre.find_by!(slug: params[:slug])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
