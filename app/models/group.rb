class Group < ActiveRecord::Base
  include SearchEngine
  has_paper_trail :ignore => [:delta]
  acts_as_taggable_on :tags, :technologies
  sortable :created_at, :desc

  has_attached_file :logo, 
                    :styles => { :medium => '220x220', :thumb => '48x48' }, 
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "#{self.to_s.downcase}/:attachment/:id/:style.:extension",
                    :url  => ":s3_eu_url"

  default_serialization_options :include => { :projects => {:include => [:tags, :technologies]}, 
                                              :companies => {:include => [:tags, :technologies]},
                                              :members  => {:include => [:tags, :technologies]},
                                              :tags => {},
                                              :technologies => {}}

  has_many :group_projects
  has_many :projects, :through => :group_projects

  has_many :group_memberships
  has_many :members, :through => :group_memberships, :source => :person

  has_many :sponsorships
  has_many :companies, :through => :sponsorships

  validates_presence_of :name
end




# == Schema Information
#
# Table name: groups
#
#  id                :integer(4)      not null, primary key
#  name              :string(255)
#  description       :text
#  url               :string(255)
#  mailing_list      :string(255)
#  twitter           :string(255)
#  meeting_info      :text
#  created_at        :datetime
#  updated_at        :datetime
#  logo_url          :string(255)
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer(4)
#  logo_updated_at   :datetime
#  delta             :boolean(1)      default(TRUE), not null
#

