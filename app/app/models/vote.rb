class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  counter_culture :manga, column_name: -> (model) { model.vote_type_name }

  def vote_type_name
    vote_type == 1 ? 'good' : 'bad'
  end
end
