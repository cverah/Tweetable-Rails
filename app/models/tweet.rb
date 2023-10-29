class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  # self join
  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count
  has_many :retweets, class_name: "Tweet", foreign_key: "replied_to_id", dependent: :destroy, inverse_of: "replied_to"

  # validates
  validates :body, presence: true, length: { maximum: 140 }

  # notes luego borrar
  # replies_to -> comentario principal
  # retweets -> respuestas del comentario principal
  # ejemplo agregar t1.retweets << t2
end
