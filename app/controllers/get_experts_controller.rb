class GetExpertsController < ApplicationController
  def index
    
    @expert_specialization_list = TalentType.all
    @request = Request.new
    @request.build_talent_request
    # @request = Request.new(user_id: current_or_guest_user.id)
    # @request.save! 
    # @talent_requests = @request.talent_requests.build
    #@talent_requests = TalentRequest.new
    # request = @talent_requests.build_request
  end
  def create
    @expert_specialization_list = TalentType.all
    @request = Request.new(request_params)
    if @request.save
      flash[:notice] = "You request has been recieved."
      redirect_to root_path, notice: 'request has been recieved.'
    else
      render :index
    end
    # @talent_requests = TalentRequest.new(talent_request_params)
    #@talent_requests = TalentRequest.new(talent_request_params)
    # if @talent_requests.save!
    #   redirect_to root_path, notice: 'request has been recieved.'
    # else
    #   render :index
    # end
  end
  

  private
    def request_params
      params.require(:request).permit(:user_id,:email,:phoneNumber,talent_request_attributes: [:user_id,:unit_price,:expected_contract_duration,:expected_start_date,:quantity,:talent_type_id])
    end
    def talent_request_params
      params.require(:request_params).permit(:user_id,:email,:phoneNumber,talent_request_attributes: [:unit_price,:expected_contract_duration,:expected_start_date,:quantity,:talent_type_id])
    end
    
    
end
