require 'spec_helper'

describe User do

  describe '#grant' do
    it "never raises an exception" do
      user = Factory :user
      user.grant!
    end
    it "sets user as admin" do
      user = Factory :user
      user.grant!
      user.admin.should be_true
    end
    it "persists user as admin" do
      user = Factory :user
      user.grant!
      user.changed?.should be_false
    end  
  end
end  