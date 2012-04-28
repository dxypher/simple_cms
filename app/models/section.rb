class Section < ActiveRecord::Base
  attr_accessible :content, :content_type, :name, :position, :visilbe

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
end
