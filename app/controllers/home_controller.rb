class HomeController < ApplicationController
    layout "home"

    def index
        @expert_specialization_list = TalentType.all
        @request = Request.new
        @request.talent_requests.build
        @posts = Post.recent
    end

    def service
        
    end
    def become_a_partner
        @message = Message.new
    end
    def contact
        @message = Message.new
    end
    def create
        @message = Message.new message_params
        if @message.valid?
            ContactMailer.with(message: @message).contact.deliver_now
            redirect_to root_path
            flash[:notice] = "We have received your message and will be in touch soon!"
            else
            flash[:notice] = "There was an error sending your message. Please try again."
            render :become_a_partner
            end
    end
    private
    def message_params
        params.require(:message).permit(:name, :email, :phone_number, :body,:location, :company_about)
    end
end
