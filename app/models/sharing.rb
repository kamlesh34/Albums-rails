class Sharing < ActiveRecord::Base
has_and_belongs_to_many :photos
has_many :comments, :dependent => :destroy
has_many :likes, :dependent => :destroy
belongs_to :user
end
