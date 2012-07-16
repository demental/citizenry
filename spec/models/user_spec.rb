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
  describe 'User.find_or_create_sample' do
    subject { User.find_or_create_sample }
    it { should be_valid }
    it { should be_persisted }
    its(:admin) { should be_true }
  end
end