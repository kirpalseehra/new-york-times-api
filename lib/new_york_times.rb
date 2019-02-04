require_relative 'services/movie_reviews'

class NewYorkTimes

  def movie_review_service
    MovieReview.new
  end

end

# test = NewYorkTimes.new
# p test.movie_review_service.current_movie_reviews('')