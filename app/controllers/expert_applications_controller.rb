class ExpertApplicationsController < ApplicationController
  before_action :set_expert_application, :only => [:show,:accept_application]

  def index
    @expert_specializations = TalentType.all
  end

  def new
    @expert_specializations = TalentType.all
    @expert_application = ExpertApplication.new
  end

  def show;end
  
   #TODO ADD COOLECTION FOR CERTIFICATION
  def create
    @expert_specializations = TalentType.all
    @expert_application = ExpertApplication.new(expert_application_params)
      if @expert_application.save
        redirect_to root_path
        flash[:notice] = "APPLICATION SUBMITTED SUCCESSFULLY"
      else
        render :new
      end
  end

  def accept_application
    @expert_application.accept_application
    redirect_to dashboard_application_path
  end
  
  private
    def expert_application_params
      params.require(:expert_application).permit(:firstName,:lastName,:email, :phoneNumber, :contactAddress,:shortBio, :talent_type_id, :suggested_skill)
    end

    def set_expert_application
      @expert_application = ExpertApplication.find(params[:id])
    end
end
