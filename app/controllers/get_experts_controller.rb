class GetExpertsController < ApplicationController
  # TODO , CHECK ROUTE DEF
  def new
    @expert_specializations = TalentType.all
    @request = Request.new
    @request.build_talent_request
  end

  def create
    @expert_specializations = TalentType.all
    @request = Request.new(request_and_talent_request_params)
      if @request.save
          SendMailToAdminForATalentRequestJob.perform_later(@request.id)
          SendAdmittedMsgForTalentRequestJob.perform_later(@request.id)
          flash[:notice] = "You request has been recieved."
          redirect_to root_path, notice: 'request has been recieved.'
      else
         render :index
      end
  end
  
  private
    def request_and_talent_request_params
      params.require(:request).permit(:user_id,:email,:phoneNumber,talent_request_attributes: [:user_id,:unit_price,:expected_contract_duration,:expected_start_date,:quantity,:talent_type_id])
    end
end
