class VotesController < ApplicationController
  def good
    if (vote = Vote.find_by(user_id: current_user.id, manga_id: params[:manga_id]))
      vote.destroy
    end
    @vote = Vote.create(user_id: current_user.id, manga_id: params[:manga_id], vote_type: 1)
    @manga = Manga.find(params[:manga_id])
  end


  def bad
    if (vote = Vote.find_by(user_id: current_user.id, manga_id: params[:manga_id]))
      vote.destroy
    end
    @vote = Vote.create(user_id: current_user.id, manga_id: params[:manga_id], vote_type: 2)
    @manga = Manga.find(params[:manga_id])
  end

  def destroy
    vote = Vote.find_by(user_id: current_user.id, manga_id: params[:manga_id])
    vote.destroy
    @manga = Manga.find(params[:manga_id])
  end
end
