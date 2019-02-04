require 'json'
require 'httparty'
require 'dotenv'

class MovieReview

  include HTTParty

  base_uri 'https://api.nytimes.com'

  def current_movie_reviews(movie_key)
    @movie_review_request = JSON.parse(self.class.get("/svc/movies/v2/reviews/search.json?query=gladiator&api-key=tVjawWx5MnoSNJuisipioq59ZIE4qWnw").body)
  end

  def retrieve_review
    @movie_review_request
  end

  def retrieve_review_status
   retrieve_review['status']
  end

  def retrieve_review_copyright
    retrieve_review['copyright']
  end

  def retrieve_review_has_more
    retrieve_review['has_more']
  end

  def retrieve_review_num_results
    retrieve_review['num_results']
  end

  def retrieve_review_results
    retrieve_review['results']
  end

  def retrieve_all_titles
    title_loop = []
    retrieve_review_results.each do |title|
      title_loop.push title['display_title']
    end
    title_loop
  end

  def retrieve_any_title
    retrieve_all_titles[3]
  end

  def retrieve_all_mpaa_rating
    mpaa_rating_loop = []
    retrieve_review_results.each do |mpaa|
      mpaa_rating_loop.push mpaa['mpaa_rating']
    end
    mpaa_rating_loop
  end

  def retrieve_any_mpaa_rating
    retrieve_all_mpaa_rating[3]
  end

end

test = MovieReview.new
test.current_movie_reviews('')
p test.retrieve_any_mpaa_rating
