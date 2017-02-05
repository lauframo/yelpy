class Restaurant < ActiveRecord::Base
  belongs_to :creator, { class_name: "User" }
  has_many :reviews
  has_many :reviewers, { through: :reviews, source: :author }

  validates :name, :address, :city, :state, :creator_id, :cuisine, { presence: true }

  def average_score
    total_points = self.reviews.reduce(0) do |sum, review|
      sum + review.points
    end
    average = total_points/self.reviews.count
    average
  end

end
