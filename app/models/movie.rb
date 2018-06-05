class Movie < ApplicationRecord
  belongs_to :director
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  before_save :generate_slug

  def generate_slug
    self.slug = title.parameterize
  end

  def similarly_rated
    Movie.where("rating = ? and id != ?", rating, id).limit(3)
  end
end
