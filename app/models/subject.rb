class Subject < ActiveRecord::Base
  attr_accessible :name, :position, :visible

  has_many :pages
  validates :name, :presence => true,
  				   :length => {:maximum => 255}


end
