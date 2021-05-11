class UserNotifierMailer < ApplicationMailer
    default :from => 's3825891@student.rmit.edu.au'
    
    def send_newsletter_email(email)
        mail( :to => email,
        :subject => 'Thanks for siging up for the newsletter')
    end
    
end
