class Admin::TagsController < Admin::Base
  def create
    @manga = Manga.find(params[:manga_id])
    @tag = @manga.tags.create(tag_params)
    redirect_to edit_admin_manga_path(@manga)
  end

  def destroy
    @manga = Manga.find(params[:manga_id])
    @tag = @manga.tags.find(params[:id])
    @tag.destroy
    redirect_to admin_manga_path(@manga)
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
