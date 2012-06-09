class List < ActiveRecord::Base
	has_many :share
	has_many :user, :through => :share
end
