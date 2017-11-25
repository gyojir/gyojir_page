class MangasController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
