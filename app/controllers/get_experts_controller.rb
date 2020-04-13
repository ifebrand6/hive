class GetExpertsController < ApplicationController
  def index
    @expert_specialization_list = TalentType.all
    @request = Request.new
    @talent_requests = @request.talent_requests.build
  end

  def create
    @request = Request.find(params[:id])
    @talent_requests = @request.talent_requests.build(talent_request_params)

    if @talent_requests.save!
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
