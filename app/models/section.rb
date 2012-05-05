class Section < ActiveRecord::Base
  attr_accessible :content, :content_type, :name, :position, :visible

  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"

  CONTENT_TYPE =['text', 'HTML']

  validates :name, :presence => true,
  				   :length => {:maximum => 255}

  validates :content_type, :inclusion =>{:in => CONTENT_TYPE}
  validates :content, :presence => true


end
