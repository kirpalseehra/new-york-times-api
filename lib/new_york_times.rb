require_relative 'services/movie_review'

class NewYorkTimes
  
  def movie_review_service
    MovieReview.new
  end
end