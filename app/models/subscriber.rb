class Subscriber < ActiveRecord::Base
    
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_DATE_REGEX = /\A[0-9]{10}\z/i

    before_save :downcase_email
    validate :recieve_mail
    validate :no_email_date
	validates :email, 
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }, 
        allow_nil: false

    # create a subscriber and return it
    def self.create_subscriber(email)
        Subscriber.create!(email: email,
                           recieve_mail: true,
                           no_email_date: None
                          )
    end



    private
	    # Converts email to lowercase 
	    def downcase_email
	      self.email = email.downcase unless self.email.nil?
        end
end
