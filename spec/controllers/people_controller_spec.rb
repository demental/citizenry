require 'spec_helper'

describe PeopleController do
  render_views
  before { DatabaseCleaner.clean }

  describe '#index' do
    before do
      @people = []
      10.times { @people << Factory(:person) }
    end  

    context "when user is not signed in" do
      it "does not have delete links for each user" do
        get :index
        response.should be_success
        @people.each do |person|
          response.body.should_not have_selector("a[href='#{person_path(person)}'][data-method='delete']")
        end
      end
    end

    context "when user is signed in" do
      before do
        @user = Factory :user
        sign_in @user
      end

      context "when user is not admin" do

        it "does not have delete links for each user" do
          get :index
          response.should be_success
          @people.each do |person|
            response.body.should_not have_selector("a[href='#{person_path(person)}'][data-method='delete']")
          end
        end
      end
      
      
      context "when user is admin" do
        before do
          @user.grant!
        end

        it "has delete links for each user" do
          people = []
          10.times { people << Factory(:person) }
          get :index
          people.each do |person|
            response.body.should have_selector("a[href='#{person_path(person)}'][data-method='delete']")
          end
        end
      end
    end    
  end
end        