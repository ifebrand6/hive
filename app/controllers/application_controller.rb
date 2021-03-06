class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_sign_up_params, if: :devise_controller?
    before_action :current_or_guest_user

    rescue_from CanCan::AccessDenied do |exception|
        flash[:warning] = exception.message
        redirect_to root_path
     end
  # if user is logged in, return current_user, else return guest_user
    def current_or_guest_user
        if current_user
            if session[:guest_user_id] && session[:guest_user_id] != current_user.id
                handing_off_guest_props_data_to_current_user
                # reload guest_user to prevent caching problems before destruction
                guest_user(with_retry = false).try(:reload).try(:destroy)
                session[:guest_user_id] = nil
            end
        current_user
        else
        guest_user
        end
    end
    # find guest_user object associated with the current session,
    # creating one as needed
    def guest_user(with_retry = true)
        # Cache the value the first time it's gotten.
        @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

    rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
        session[:guest_user_id] = nil
        guest_user if with_retry
    end

    def get_expert_talents
        experts = TalentType.all
     end
     private

     
    private
     # this hand off from guest_user to current_user.
     def handing_off_guest_props_data_to_current_user

         guest_requests = guest_user.requests.all
         guest_requests.each do |request|
         request.user_id = current_user.id
         request.save!  
         end
         guest_talent_requests = guest_user.talent_requests.all
         guest_talent_requests.each do |talent_request|
         talent_request.user_id = current_user.id
         talent_request.save!
         end

         guest_finalized_requests = guest_user.finalized_requests.all
         guest_finalized_requests.each do |finalized_request|
         finalized_request.user_id = current_user.id
         finalized_request.save!
         end   
     end

     def create_guest_user
         u = User.new(:email => "guest_#{Time.now.to_i}#{rand(100)}@example.com",:guest => true, :customer_role => false)
         u.save!(:validate => false)
         session[:guest_user_id] = u.id
         u
     end

     def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:customer_role])
    end

    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
        if current_user.admin_role == true
            dashboard_index_path
        elsif current_user.customer_role == true
            dashboard_path
        else
            root_path
        end
    end
end
