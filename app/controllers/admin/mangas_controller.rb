class Admin::MangasController < Admin::Base
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

    if !params[:manga][:image].nil?
      File.delete('./public' + @manga.path)
      @manga.path = '/images/'+ params[:manga][:image].original_filename
      File.open('./public' + @manga.path, 'wb') do |f|
        f.write(params[:manga][:image].read)
      end
    end

    if @manga.update(params.require(:manga).permit(:title, :comment))
      redirect_to manga_path(@manga)
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

    redirect_to admin_mangas_path
  end
end
