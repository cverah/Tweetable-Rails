class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :likes_count
  
  # validates
  # Restricción de unicidad para user_id y tweet_id
  # userid y tweet_id son una combinacion unica
  validates :user_id, uniqueness: { scope: :tweet_id, message: "This tweet has already been liked" }
end
