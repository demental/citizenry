class Group < ActiveRecord::Base
  include SearchEngine
  has_paper_trail
  acts_as_taggable_on :tags, :technologies
  sortable :created_at, :desc

  has_attached_file :logo, :styles => { :medium => '220x220', :thumb => '48x48' }, :url => "/system/:attachment/:id/:style/:safe_filename"

  default_json_options :include => [:projects, :members, :companies]

  has_many :group_projects
  has_many :projects, :through => :group_projects

  has_many :group_memberships
  has_many :members, :through => :group_memberships, :source => :person

  has_many :sponsorships
  has_many :companies, :through => :sponsorships

  validates_presence_of :name

  define_index do
    indexes :name, :sortable => true
    indexes :description
    indexes :url
    indexes :address
    indexes technology_taggings.tag.name, :as => :technologies
    indexes tag_taggings.tag.name, :as => :tags

    has :created_at, :updated_at
  end
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
#

