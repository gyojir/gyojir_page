require 'will_paginate/array'
class Admin::MangasController < Admin::Base
  def index
    @mangas = Manga.order(::Manga::ORDERS["新しい順"]).paginate(page: params[:page])
    #@mangas = Manga.all
  end

  def new
    @manga = Manga.new
    @manga.tags.build
  end

  def create
    # binding.pry

    @manga = Manga.new(manga_params)
    @manga.good = 0
    @manga.bad = 0

    if @manga.save
      redirect_to manga_path(@manga)
    else
      render 'new'
    end
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id])
    if @manga.update(manga_params)
      redirect_to admin_mangas_path
    else
      render 'edit'
    end
  end

  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy

    redirect_to admin_mangas_path
  end

  def manga_params
    params.require(:manga).permit(:title, :comment, :image, :image_cache, :remove_image, tags_attributes: [:id, :name, :_destroy])
  end
end
