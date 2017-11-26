class MangasController < ApplicationController
  def index
    @mangas = Manga.paginate(page: params[:page])
    #@mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
