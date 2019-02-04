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
   it 'should return the has_more as a Boolean' do 
    expect(@movie_review_service.retrieve_review_has_more).to be(true).or be(false)
   end

   it 'should return the num_results as an Integer' do 
    expect(@movie_review_service.retrieve_review_num_results).to be_kind_of(Integer)
   end

   it 'should return the review results as an Array' do 
    expect(@movie_review_service.retrieve_review_results).to be_kind_of(Array)
   end

   it 'should return all the display titles as an Array' do 
    expect(@movie_review_service.retrieve_all_titles).to be_kind_of(Array)
   end

   it 'should return all the display titles with Gladiator in it' do
    expect(@movie_review_service.retrieve_all_titles).to include("Gladiator")
   end

   it 'should return individual display titles as a String' do
    expect(@movie_review_service.retrieve_any_title).to be_kind_of(String)
   end

   it 'should return all the mpaa ratings as an Array' do
    expect(@movie_review_service.retrieve_all_mpaa_rating).to be_kind_of(Array)
   end

   it 'should return individual mpaa ratings as a String' do
    expect(@movie_review_service.retrieve_any_title).to be_kind_of(String)
   end



   




  end

end