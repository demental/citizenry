require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')


feature "The people API" do
  background do
    DatabaseCleaner.clean
    FactoryGirl.create(:person, name: 'person_name')
  end

  scenario "getting a random person" do
    visit '/api/people/random.json'
    puts page.body
    ActiveSupport::JSON.decode(page).name.should eql 'person_name'
  end
end