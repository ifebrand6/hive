class GetExpertsController < ApplicationController
  # TODO RENAME METHOD TO NEW, CHECK ROUTE DEF, RENAME VIEW, RENAME REQUESTS TO SING(NEW/CREATE)
  def index
    @expert_specializations = TalentType.all
    @requests = Request.new
    @requests.build_talent_request
  end

  def create
    @expert_specializations = TalentType.all
    @requests = Request.new(request_and_talent_request_params)
      if @requests.save
          SendMailToAdminForATalentRequestJob.perform_later(@requests.id)
          SendAdmittedMsgForTalentRequestJob.perform_later(@requests.id)
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
