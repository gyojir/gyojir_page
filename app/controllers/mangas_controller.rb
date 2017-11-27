class MangasController < ApplicationController
  def index
    params[:order] ||= "新しい順"
    @mangas = Manga.order(::Manga::ORDERS[params[:order]])
    @mangas = @mangas.paginate(page: params[:page])
    #@mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
