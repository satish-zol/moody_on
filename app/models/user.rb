class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :provider, :uid, :about_me, :dob, :hometown, :location, :relationships, :status, :gender, :organisation, :designation, :profession, :facebook_url, :educational_details, :facebook_image
  
  
 #for facebook integration with omniauth
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.new(name:auth.extra.raw_info.name.present? ? auth.extra.raw_info.name : "",
                      provider:auth.provider.present? ? auth.provider : "",
                      uid:auth.uid.present? ? auth.uid : "",
                      email:auth.info.email,
                      password:Devise.friendly_token[0,20],
                      about_me:auth.extra.raw_info.bio.present? ? auth.extra.raw_info.bio : "",
                      dob:auth.extra.raw_info.birthday.present? ? auth.extra.raw_info.birthday : "",
                      hometown:auth.extra.raw_info.hometown.name.present? ? auth.extra.raw_info.hometown.name : "",
                      location:auth.extra.raw_info.location.present? && auth.extra.raw_info.location.name.present? ? auth.extra.raw_info.location.name : "",
                      relationships:auth.extra.raw_info.relationship_status.present? ? auth.extra.raw_info.relationship_status : "",
                      gender:auth.extra.raw_info.gender.present? ? auth.extra.raw_info.gender : "",
                      organisation:auth.extra.raw_info.work.present? && auth.extra.raw_info.work[0].employer.present? ?  auth.extra.raw_info.work[0].employer.name : "",
                      designation:auth.extra.raw_info.work.present? && auth.extra.raw_info.work[0].position.present? ? auth.extra.raw_info.work[0].position.name : "",
                      facebook_url:auth.info.urls.Facebook.present? ? auth.info.urls.Facebook : "" ,
                      educational_details:auth.extra.raw_info.education.present? ? auth.extra.raw_info.education[1].school.name : "" ,
                      facebook_image:auth.info.image.present? ? auth.info.image : ""
                      )
      user.skip_confirmation!
      user.save!
    end
    user
  end

  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end
