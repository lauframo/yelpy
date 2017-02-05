class Review < ActiveRecord::Base
  belongs_to :author, { class_name: "User" }
  belongs_to :restaurant

  validates :content, :points, :author_id, :restaurant_id, { presence: true }


end
