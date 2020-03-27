class ExpertApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :new, :create]

  def index
    @expert_specialization_list = TalentType.all
  end
  def new
    @expert_specialization_list = TalentType.all
    @expert_application = ExpertApplication.new
    # @expert_application.talent_type = TalentType.new
  end
  def create
    @expert_specialization_list = TalentType.all
    # @expert_specialization_list.new(talent_type_params)
    # @expert_application.talent_type.save
    @expert_application = ExpertApplication.new(expert_application_params)
    if @expert_application.save
      redirect_to action: "index", flash: "APPLICATION SUBMITTED SUCCESSFULLY"
    else
      render :new
    end
  end
    private
    def expert_application_params
      params.require(:expert_application).permit(:firstName,:lastName,:email, :phoneNumber, :contactAddress,:shortBio, :talent_type_id)
    end
    def talent_type_params
      params.require(:talent_type).permit(:expert_specialization)
    end
end
