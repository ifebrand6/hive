# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
    def contact
        # Set up a temporary order for the preview
        message = Message.new(name: "Joe Smith", email: "joe@gmail.com", location: "1-2-3 Chuo, Tokyo, 333-0000", phone_number: "090-7777-8888", body: "I want to place an order!")
    
        ContactMailer.with(message: message).contact
    end

end
