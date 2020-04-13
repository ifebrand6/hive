class ContactMailer < ApplicationMailer
    def contact
        @message = params[:message]
    
        mail(to: ADMIN_EMAIL, subject: "You have a new message.")
    end
end
