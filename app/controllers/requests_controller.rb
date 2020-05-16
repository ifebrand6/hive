class RequestsController < ApplicationController
 before_action :get_talent_types
 
  def new
    @request = Request.new
    @request.talent_requests.build
    render layout: 'home'
  end
  

  def create
    @request = Request.new(request_and_talent_request_params)
    if @request.save
      flash[:notice] = "You request has been recieved."
      redirect_to confirmed_request_path(@request), notice: 'request has been recieved.'
    else
      render :new
    end
  end

  private
    def request_and_talent_request_params
      params.require(:request).permit(:user_id, :email, :phone_number, talent_requests_attributes: [:user_id, :unit_price, :expected_contract_duration, :expected_start_date, :quantity, :talent_type_id])
    end
    
    def get_talent_types
      @expert_specialization_list = TalentType.all
    end
    
end
