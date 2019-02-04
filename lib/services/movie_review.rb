require 'json'
require 'httparty'
require 'dotenv'

# This is required in order to load the .env file from this file using the API KEY
Dotenv.load('.env')

class MovieReview

  include HTTParty

  base_uri 'https://api.nytimes.com'

  def current_movie_reviews(movie_name)
    api_key = ENV['API_KEY']
    @movie_review_request = JSON.parse(self.class.get("/svc/movies/v2/reviews/search.json?query=#{movie_name}&api-key=#{api_key}").body)
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

  def retrieve_all_critics_pick
    critics_pick_loop = []
    retrieve_review_results.each do |critic|
      critics_pick_loop.push critic['critics_pick']
    end
    critics_pick_loop
  end

  def retrieve_any_critics_pick
    retrieve_all_critics_pick[0]
  end

  def retrieve_all_byline
    byline_loop = []
    retrieve_review_results.each do |byline|
      byline_loop.push byline['byline']
    end
    byline_loop
  end

  def retrieve_any_byline
    retrieve_all_byline[0]
  end

  def retrieve_all_headline
    headline_loop = []
    retrieve_review_results.each do |headline|
      headline_loop.push headline['headline']
    end
    headline_loop
  end

  def retrieve_any_headline
    retrieve_all_headline[0]
  end

  def retrieve_all_summary_short
    summary_short_loop = []
    retrieve_review_results.each do |summary|
      summary_short_loop.push summary['summary_short']
    end
    summary_short_loop
  end

  def retrieve_any_summary_short
    retrieve_all_summary_short[2]
  end

  def retrieve_all_publication_date
    publication_date_loop = []
    retrieve_review_results.each do |publication|
      publication_date_loop.push publication['publication_date']
    end
    publication_date_loop
  end

  def retrieve_any_publication_date
    retrieve_all_publication_date[2]
  end

  def retrieve_all_opening_date
    opening_date_loop = []
    retrieve_review_results.each do |opening|
      opening_date_loop.push opening['opening_date']
    end
    opening_date_loop
  end

  def retrieve_any_opening_date
    retrieve_all_opening_date[2]
  end

  def retrieve_all_date_updated
    date_updated_loop = []
    retrieve_review_results.each do |updated|
      date_updated_loop.push updated['date_updated']
    end
    date_updated_loop
  end

  def retrieve_any_date_updated
    retrieve_all_date_updated[2]
  end

  def retrieve_all_link
    link_loop = []
    retrieve_review_results.each do |link|
      link_loop.push link['link']
    end
    link_loop
  end

  def retrieve_all_type 
    type_loop = []
    retrieve_all_link.each do |type|
      type_loop.push type['type']
    end
    type_loop
  end


  def retrieve_all_url 
    url_loop = []
    retrieve_all_link.each do |url|
      url_loop.push url['url']
    end
    url_loop
  end


  def retrieve_all_suggested_link_text 
    suggested_link_loop = []
    retrieve_all_link.each do |suggested|
      suggested_link_loop.push suggested['suggested_link_text']
    end
    suggested_link_loop
  end

  def retrieve_all_multimedia
    multimedia_loop = []
    retrieve_review_results.each do |multimedia|
      multimedia_loop.push multimedia['multimedia']
    end
    multimedia_loop
  end
  
end

test = MovieReview.new
test.current_movie_reviews('gladiator')
p test.retrieve_review