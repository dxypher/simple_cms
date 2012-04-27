class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :position, :visible
end
