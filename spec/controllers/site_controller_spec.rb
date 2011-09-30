require 'spec_helper'

describe SiteController do
  render_views


  describe '#search' do
    it 'understand q param and redirect to correct search page' do
      get 'search', {:q => 'text to find'}
      response.should redirect_to('/search/text%20to%20find') # @todo write clean url here, not hardcoded
    end

    it 'redirects straight to result detail if only one result' do
      matchingperson = Factory :person, :name => 'MatchingName'
      get 'search', {:query => 'MatchingName'}
      response.should redirect_to matchingperson
    end  

    it 'shows only relevant results' do
      10.times {Factory :person}
      matchingperson = Factory :person, :name => 'MatchingName'
      matchingperson2 = Factory :person, :name => 'MatchingName2'      

      get 'search', {:query => 'MatchingName'}
      assigns(:results).length.should eql 2
      assigns(:results).includes?(matchingperson).should be_true
      assigns(:results).includes?(matchingperson2).should be_true             
    end  

  end    


end
