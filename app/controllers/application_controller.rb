class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def get_expert_talents
        experts = TalentType.all
     end
end
