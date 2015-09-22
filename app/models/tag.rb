class Tag < ActiveRecord::Base
#before_create :split_tags
has_and_belongs_to_many :photos, :dependent => :destroy

#serialize :tname, Array
 
 end
end