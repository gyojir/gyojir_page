class MangasController < ApplicationController
  before_action :basic_auth,  only: [:new, :create, :destroy] #except: [:index, :show]

  def index
    @mangas = Manga.all
  end

  def new
    @manga = Manga.new
  end

  def create
    # binding.pry

    @manga = Manga.new
    @manga.title = params[:manga][:title]
    if !params[:manga][:image].nil?
      @manga.path = '/images/' + params[:manga][:image].original_filename
      File.open('./public' + @manga.path, 'wb') do |f|
        f.write(params[:manga][:image].read)
      end
    end
    @manga.good = 0
    @manga.bad = 0
    @manga.comment = params[:manga][:comment]

    if @manga.save
      redirect_to @manga
    else
      render 'new'
    end
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def edit
    @manga = Manga.find(params[:id])
  end

  def update
    @manga = Manga.find(params[:id])

    if !params[:manga][:image].nil?
      File.delete('./public' + @manga.path)
      @manga.path = '/images/'+ params[:manga][:image].original_filename
      File.open('./public' + @manga.path, 'wb') do |f|
        f.write(params[:manga][:image].read)
      end
    end

    if @manga.update(params.require(:manga).permit(:title, :comment))
      redirect_to @manga
    else
      render 'edit'
    end
  end

  def destroy
    @manga = Manga.find(params[:id])

    if File.exist?(@manga.path)
      File.delete(@manga.path)
    end
    @manga.destroy

    redirect_to mangas_path
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV["BASIC_AUTH_USER"] && pass == ENV["BASIC_AUTH_PASS"]
    end
  end
end
