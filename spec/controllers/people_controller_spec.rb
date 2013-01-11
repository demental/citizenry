require 'spec_helper'

describe PeopleController do
  describe 'GET#show' do
    let(:person) { FactoryGirl.create(:person) }
    subject { get :show, id: person }
    it { should be_success }
    it "assigns person to the view" do
      subject
      assigns[:person].should eq person
    end
  end
end