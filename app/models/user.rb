class User < ActiveRecord::Base
has_many :albums, :dependent => :destroy
has_many :tags, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
has_attached_file :image, styles: { small: "20x20#"}
 
validates_attachment :image, :presence => true,
  content_type: {content_type: ["image/jpeg","image/gif","image/png"]}




  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]


def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    #debugger
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(username: data["name"],
          provider:access_token.provider,
          email: data["email"],
          image: data["image"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
      end
   end
end

end
