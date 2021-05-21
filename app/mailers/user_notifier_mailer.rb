class UserNotifierMailer < ApplicationMailer
    default :from => 's3825891@student.rmit.edu.au'
    
    def send_newsletter_email(email)
        mail( :to => email,
        :subject => 'Thanks for siging up for the newsletter')
    end
    
    def send_forget_password_email(email)
         @emaillink = url_for(controller: 'users',
                                    action: 'forgetpassword_edit',
                                    id: User.find_by(email: email),
                                    host: 'https://stark-bastion-27676.herokuapp.com')
        mail( :to => email,
        :subject => 'You Forgot Password? Here to rescue you!')
    end
    
end
