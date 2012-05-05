class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :position, :visible

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates :name, :presence => true,
  				   :length => {:maximum => 255}

  validates :permalink, :presence => true,
  			 	        :length => {:in => 3..255},
  			 	        :uniqueness => true
end
