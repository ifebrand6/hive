class ExpertApplicationsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:index, :new, :create, :show, :accept_application]

  def index
    @expert_specialization_list = TalentType.all
  end

  def new
    @expert_specialization_list = TalentType.all
    @expert = ExpertApplication.new
  end
  def show
    @expert = ExpertApplication.find(params[:id])
  end
  
  def create
    @expert_specialization_list = TalentType.all
    @expert = ExpertApplication.new(expert_params)
    if @expert.save
      redirect_to action: "index", flash: "APPLICATION SUBMITTED SUCCESSFULLY"
    else
      render :new
    end
  end
  def accept_application
    @expert = ExpertApplication.find(params[:id])
    @expert.onboarding_expert
    redirect_to dashboard_application_path
  end
  


    private
    def expert_params
      params.require(:expert).permit(:firstName,:lastName,:email, :phoneNumber, :contactAddress,:shortBio, :talent_type_id, :suggested_skill)
    end
    def talent_type_params
      params.require(:talent_type).permit(:expert_specialization)
    end
end
