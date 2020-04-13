class RequestsController < ApplicationController
  def index
    @expert_specialization_list = TalentType.all
    @request = Request.new
  end

  def create
    @expert_specialization_list = TalentType.all
    @requests = Request.new(request_and_talent_request_params)
    if @requests.save
      #TODO: send mail to user and admin
      flash[:notice] = "You request has been recieved."
      redirect_to root_path, notice: 'request has been recieved.'
    else
      render :index
    end
  end

  private
    def request_and_talent_request_params
      params.require(:request).permit(:user_id, :email, :phone_number, talent_request_attributes: [:user_id, :unit_price, :expected_contract_duration, :expected_start_date, :quantity, :talent_type_id])
    end
end
