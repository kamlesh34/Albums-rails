class Photo < ActiveRecord::Base
has_and_belongs_to_many :tags, :dependent => :destroy
belongs_to :album
attr_accessor :tags_attributes
#attr_accessor :split_tags
#accepts_nested_attributes_for :tags
validates :attachment => true
after_save :split_tags
has_attached_file :image,
styles: { thumb: ["120x120#", :jpg], medium: ["500x400#", :jpg]}
validates_attachment :image,
content_type: {content_type: ["image/jpeg","image/gif","image/png"]}
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
