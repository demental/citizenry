require 'spec_helper'

describe User do
  
  describe '#destroy' do
    
    it "destroys the associated person" do
      user = FactoryGirl.create(:user_with_person)
      person = user.person
      user.destroy
      person.should_not be_persisted
    end    

  end  
end