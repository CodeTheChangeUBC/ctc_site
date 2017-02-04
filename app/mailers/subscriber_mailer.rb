class SubscriberMailer < ApplicationMailer
    RESULT_CODE_SUCCESS = 200
        
    def welcome_email(subscriber)
        @subscriber = subscriber
        @url = 'http://www.codethechangeubc.org'
        mg_client = Mailgun::Client.new ENV['mailgun_api_key']
        message_params = { :from    => ENV['mailgun_email_address'],
                           :to      => @subscriber.email,
                           :subject => 'Welcome to the UBC Code the Change Community!',
                           :text    => 'test'
        }
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
        end
        puts '============='
    end
end