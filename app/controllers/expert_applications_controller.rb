class ExpertApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :new, :create, :show, :accept_application]

  def index
    @expert_specialization_list = TalentType.all
  end

  def new
    @expert_specialization_list = TalentType.all
    @expert_application = ExpertApplication.new
  end
  def show
    @expert_application = ExpertApplication.find(params[:id])
  end
  
  def create
    @expert_specialization_list = TalentType.all
    @expert_application = ExpertApplication.new(expert_application_params)
    if @expert_application.save
      redirect_to action: "index", flash: "APPLICATION SUBMITTED SUCCESSFULLY"
    else
      render :new
    end
  end
  def accept_application
    @expert_application = ExpertApplication.find(params[:id])
   @expert_application.onboarding_expert
    redirect_to dashboard_application_path
  end
  


    private
    def expert_application_params
      params.require(:expert_application).permit(:firstName,:lastName,:email, :phoneNumber, :contactAddress,:shortBio, :talent_type_id, :suggested_skill)
    end
    def talent_type_params
      params.require(:talent_type).permit(:expert_specialization)
    end
end
