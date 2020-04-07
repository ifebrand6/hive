class GetExpertsController < ApplicationController
  def index
    @expert_specialization_list = TalentType.all
    @request = Request.new(user_id: current_or_guest_user.id)
    @request.save! 
    @talent_requests = @request.talent_requests.build
    #@talent_requests = TalentRequest.new
    # request = @talent_requests.build_request
  end
  def create
    @talent_requests = TalentRequest.new(talent_request_params)
    fdf
    #@talent_requests = TalentRequest.new(talent_request_params)
    if @talent_requests.save!
     # send mail to admin and user
      # if user_sign_in 
      #   NotifyUser.mail.with(@request).notify_user_and_admin
      # else user_is_guest
      #   NotifyGuest.mail.with(request_email:).notify_user_and_admin
      # end
      redirect_to root_path, notice: 'request has been recieved.'
    else
      render :index
    end
  end
  

  private
    def request_params
      params.require(:request).permit(:user_id)
    end
    def talent_request_params
      params.require(:talent_request).permit(:unit_price,:expected_contract_duration,:expected_start_date,:quantity,:user_id,:request_id,:talent_type_id)
    end
    
    
end
