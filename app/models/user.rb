class User < ApplicationRecord

 enum role: [ :customer, :moderator, :admin ]
 mount_uploader :photo, PhotoUploader

	include Clearance::User

	has_many :authentications, dependent: :destroy
	has_many :listings
	has_many :reservations

	def self.create_with_auth_and_hash(authentication, auth_hash)
		byebug
		user = self.create!(
			name: auth_hash["extra"]["raw_info"]["name"],
			email: auth_hash["extra"]["raw_info"]["email"],
			password: SecureRandom.hex(5)
			)
		user.authentications << authentication
		return user
	end

  # grab fb_token to access Facebook for user data
  def fb_token
  	x = self.authentications.find_by(provider: 'facebook')
  	return x.token unless x.nil?
  end

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end

