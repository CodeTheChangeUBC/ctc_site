class Member < ActiveRecord::Base
	attr_accessor :remember_token
	before_save :downcase_email
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


    private 

	    # Converts email to lowercase 
	    def downcase_email
	      self.email = email.downcase
	    end

end
