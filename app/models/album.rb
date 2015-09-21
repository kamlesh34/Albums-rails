class Album < ActiveRecord::Base
has_many :tags, :dependent => :destroy
has_many :photos, :dependent => :destroy
belongs_to :user
end
 