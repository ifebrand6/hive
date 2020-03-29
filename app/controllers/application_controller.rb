class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :create_guest_if_needed
    before_action :authenticate_user!
    before_action :create_guest_if_needed

    def create_guest_if_needed
        return if session[:user_id] # already logged in, don't need to create another one
        @current_user = User.new_guest
        @current_user.save!
        session[:user_id] =  @current_user.id     
        #write an if statement, if session exist teruns                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       end
    end
    def get_expert_talents
        experts = TalentType.all
     end
end
