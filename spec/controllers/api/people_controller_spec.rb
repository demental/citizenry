require 'spec_helper'

describe Api::PeopleController do
  describe 'GET#random' do
    before  { Person.stub(find_random: 'a_person') }
    subject { get :random, format: :json }
    it "should assign a random person to the view" do
      subject
      assigns[:person].should eq 'a_person'
    end
  end
end
