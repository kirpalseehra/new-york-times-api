require 'spec_helper'

describe NewYorkTimes do

  context 'Tests for movie reviews' do

   before(:all) do
    @movie_key = ENV['API_KEY']
    @movie_review_service = NewYorkTimes.new.movie_review_service
    @movie_review_service.current_movie_reviews('gladiator')
   end

   it 'should return the status as an String' do
    expect(@movie_review_service.retrieve_review_status).to be_kind_of(String)
   end

   it 'should return the copyright as a String' do 
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

   it 'should return all the display titles as Strings' do 
    @movie_review_service.retrieve_all_titles.each do |title| 
      expect(title).to be_kind_of(String)
    end
   end

   it 'should return all the display titles with Gladiator in it' do 
    @movie_review_service.retrieve_all_titles.each do |title| 
      expect(title).to include("Gladiator")
    end
   end

   it 'should return all the mpaa ratings as Strings' do
    @movie_review_service.retrieve_all_mpaa_rating.each do |mpaa|
      expect(mpaa).to be_kind_of(String)
    end
   end

   it 'should return all the critics picks as Integers' do
    @movie_review_service.retrieve_all_critics_pick.each do |critic|
      expect(critic).to be_kind_of(Integer)
    end
   end

   it 'should return all the bylines as Strings' do
    @movie_review_service.retrieve_all_byline.each do |byline|
      expect(byline).to be_kind_of(String)
    end
   end

   it 'should return all the headlines as Strings' do
    @movie_review_service.retrieve_all_headline.each do |headline|
      expect(headline).to be_kind_of(String)
    end
   end

   it 'should return all the short summaries as Strings' do
    @movie_review_service.retrieve_all_summary_short.each do |summary|
      expect(summary).to be_kind_of(String)
    end
   end

   it 'should return all the publication dates as Strings' do
   @movie_review_service.retrieve_all_publication_date.each do |publication|
      expect(publication).to be_kind_of(String)
    end
   end

   # testing the length of the string is equal to 10 characters long 
   it 'should return all the publication dates as 10 characters long' do
    @movie_review_service.retrieve_all_publication_date.each do |publication|
      expect(publication.length).to eq 10
    end
   end

   it 'should return all the opening dates as Strings' do
    @movie_review_service.retrieve_all_opening_date.each do |opening|
      expect(opening).to be_kind_of(String) | be_nil
    end
   end

   it 'should return all the updated dates as Strings' do
    @movie_review_service.retrieve_all_date_updated.each do |updated| 
      expect(updated).to be_kind_of(String)
    end
   end

   it 'should return all the updated dates as 19 characters long' do
    @movie_review_service.retrieve_all_date_updated.each do |updated| 
      expect(updated.length).to eq 19
    end
   end

   it 'should return all the types as Strings' do
    @movie_review_service.retrieve_all_type.each do |type|
      expect(type).to be_kind_of(String)
    end
   end

   it 'should return all the urls as Strings' do
    @movie_review_service.retrieve_all_url.each do |url|
      expect(url).to be_kind_of(String)
    end
   end

   it 'should return all the urls that include .html' do
    @movie_review_service.retrieve_all_url.each do |url|
      expect(url).to include(".html")
    end
   end

   it 'should return all the suggested links as Strings' do
    @movie_review_service.retrieve_all_suggested_link_text.each do |suggested|
      expect(suggested).to be_kind_of(String)
    end
   end

   it 'should return all the multimedia as null' do
    @movie_review_service.retrieve_all_multimedia.each do |multimedia|
      expect(multimedia).to be_nil
    end
   end

  end
end