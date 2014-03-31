class User < ActiveRecord::Base
	 validates_presence_of :name
   validates :price, inclusion: 1..999
end
