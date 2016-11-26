class Member < ActiveRecord::Base
	attr_accessor :remember_token
	before_save :downcase_email
	mount_uploader :avatar, AvatarUploader
	validates :firstName,  presence: true, length: { maximum: 50 }
	validates :lastName, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

	class << self
		# Returns the hash digest of the given string.
		def Member.digest(string)
			cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
			                                              BCrypt::Engine.cost
			BCrypt::Password.create(string, cost: cost)
		end

		# Returns a random token
		def Member.new_token
			SecureRandom.urlsafe_base64
		end
	end

	# Create with omniauth(auth)
	def self.create_with_omniauth(auth)
		# Split name into first and last
		if !auth["info"]["name"].nil?
			fullname = auth["info"]["name"].split(' ')
			firstName = fullname[0]
			lastName = fullname[fullname.size-1]
			lastName = lastName == firstName ? "" : lastName
		else
			firstName = auth["info"]["nickname"]
            fullName = firstName
		end

		password = SecureRandom.urlsafe_base64
		# Create member
		Member.create!( provider: auth["provider"],
						uid: auth["uid"],
						firstName: fullname[0],
						lastName: lastName,
						email: auth["info"]["email"],
						password: password,
						password_confirmation: password
		)
	end

	# Remembers a member in the database for persistent sessions
	def remember
		self.remember_token = Member.new_token
		update_attribute(:remember_digest, Member.digest(remember_token))
	end

	# Returns true if the given token matches the digest
	def authenticated?(remember_token)
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

	# Forgets a member
	def forget
		update_attribute(:remember_digest, nil)
	end

	# Make this member an exec 
	def make_exec
		update_attribute(:exec, true)
	end

	# Remove this member as an exec
	def unmake_exec
		update_attribute(:exec, false)
	end

	# Returns member profile picture
	def picture
	    if self.avatar?
	      self.avatar.url
	    else
	      '1.jpg'
	    end
  	end

    private 

	    # Converts email to lowercase 
	    def downcase_email
	      self.email = email.downcase
	    end

end
