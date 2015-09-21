class Tag < ActiveRecord::Base
#before_create :split_tags
has_and_belongs_to_many :photos

#serialize :tname, Array
 def split_tags

  @tags=self.tname.split(",")
  byebug
  @tags.each do |name|
unless Tag.where(tname: name)
Tag.create(:tname => name)

end
  	#unless Tag.find_by_tname(name)

  	#	@tag=Tag.create(:tname => name)
  	#	@tag.save

  	#end
#  	debugger
  end

 end
end