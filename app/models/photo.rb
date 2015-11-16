class Photo < ActiveRecord::Base

mount_uploader :snaps, SnapsUploader
has_and_belongs_to_many :tags, :dependent => :destroy
has_and_belongs_to_many :sharings, :dependent => :destroy
belongs_to :album
attr_accessor :tags_attributes
#attr_accessor :split_tags
#accepts_nested_attributes_for :tags
validates :snaps, presence: true
after_save :split_tags

#before_save :tag_split
private
def split_tags
	@user_id=self.album.user_id
	#debugger
	if @tags_attributes
	self.tags=@tags_attributes.split(",").map do |name|
				Tag.where(tname: name).first_or_create(:tname => name, :user_id => @user_id)
		end
end
end
end
