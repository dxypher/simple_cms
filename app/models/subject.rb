class Subject < ActiveRecord::Base
  attr_accessible :name, :position, :visible

  has_many :pages
end
