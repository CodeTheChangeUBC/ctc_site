class Subscriber < ActiveRecord::Base
    
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_DATE_REGEX = /\A[0-9]{10}\z/i

    before_save :downcase_email
    validates :recieve_mail, allow_nil: false
    validates :signup_date, allow_nil: false, format: { with: VALID_DATE_REGEX }
    validates :no_email_date, allow_nil: true
	validates :email, 
        length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX },
        uniqueness: { case_sensitive: false }, 
        allow_nil: true

    # create a subscriber and return it
    def self.create_subscriber(email)
        Subscriber.create!(email: email,
                           recieve_mail: True,
                           signup_date: time().now(),
                           no_email_date: None
                          )
    end



    private
	    # Converts email to lowercase 
	    def downcase_email
	      self.email = email.downcase unless self.email.nil?

end