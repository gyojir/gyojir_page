class MangasController < ApplicationController
  def index
    @order = Order.find_by(name: params[:order].nil? ? "古い順" : params[:order][:order])
    @mangas = Manga.order(@order.expression)
    @mangas = @mangas.paginate(page: params[:page])
    #@mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end
end
