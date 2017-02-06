class SubscriberMailer < ApplicationMailer
    RESULT_CODE_SUCCESS = 200
        
    def welcome_email(subscriber)
        @subscriber = subscriber
        @url = 'http://www.codethechangeubc.org'
        template = SubscriberMailer.welcome_email
        puts template
        mg_client = Mailgun::Client.new ENV['mailgun_api_key']
        message_params = { :from    => ENV['mailgun_email_address'],
                           :to      => @subscriber.email,
                           :subject => 'Welcome to the UBC Code the Change Community!',
                           :html    => render(template: "subscriber_mailer/welcome_email")
        }
        puts message_params
        result = mg_client.send_message ENV['mailgun_domain'], message_params
        puts '============='
        puts 'EMAIL RESULTS'
        # TODO: Add more result code handlers
        if result.code == RESULT_CODE_SUCCESS
            puts 'Email Success!'
            body = JSON.parse(result.body)
            puts 'results:'
            puts '    id: ' + body['id']
            puts '    message: ' + body['message']
        else
            puts result.code
        end
        puts '============='
    end
end
