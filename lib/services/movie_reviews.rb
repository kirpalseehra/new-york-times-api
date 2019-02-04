require 'json'
require 'httparty'
require 'dotenv'

class MovieReview

  include HTTParty

  base_uri 'https://api.nytimes.com'

  def current_movie_reviews(movie_key)
    @movie_review_request = JSON.parse(self.class.get("/svc/movies/v2/reviews/search.json?query=gladiator&api-key=tVjawWx5MnoSNJuisipioq59ZIE4qWnw").body)
  end

  def retrieve_review_results 
    @movie_review_request['status']
  end

end

test = MovieReview.new
test.current_movie_reviews('tVjawWx5MnoSNJuisipioq59ZIE4qWnw')
p test.retrieve_review_results
