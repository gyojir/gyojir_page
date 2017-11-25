class TagsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @manga = Manga.find(params[:manga_id])
    @tag = @manga.tags.create(tag_params)
    redirect_to edit_manga_path(@manga)
  end

  def destroy
    @manga = Manga.find(params[:manga_id])
    @tag = @manga.tags.find(params[:id])
    @tag.destroy
    redirect_to manga_path(@manga)
  def

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
