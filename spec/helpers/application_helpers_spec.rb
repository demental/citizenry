require 'spec_helper'

describe ApplicationHelper do
  subject { tag_list( ['my','tag'], :company) }
  describe '#tag_list' do
    it "creates clickable list of tags" do
      subject.should eql '<a href="/companies/tag/my">my</a>, <a href="/companies/tag/tag">tag</a>'
    end
  end
end