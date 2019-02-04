require 'spec_helper'

describe NewYorkTimes do

  context 'Tests for movie reviews' do

   before(:all) do
    @movie_key = ENV['api_key']
    @movie_review_service = NewYorkTimes.new.movie_review_service
    @movie_review_service.current_movie_reviews('gladiator')
   end

   it 'should return the status as an String' do
    expect(@movie_review_service.retrieve_review_status).to be_kind_of(String)
   end

   it 'should return the copyright as an String' do 
    expect(@movie_review_service.retrieve_review_copyright).to be_kind_of(String)
   end

   # tests for a boolean data type
   it 'should return the has more as a boolean' do 
    expect(@movie_review_service.retrieve_review_has_more).to be(true).or be(false)
   end




  end

end