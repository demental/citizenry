require File.expand_path(File.dirname(__FILE__) + '/../acceptance_helper')


feature "The people API" do
  background do
    DatabaseCleaner.clean
    FactoryGirl.create(:person, name: 'person_name')
  end

  scenario "getting a random person" do
    get '/api/people/random.json'
    puts json
    json['person']['name'].should eql 'person_name'
  end
end