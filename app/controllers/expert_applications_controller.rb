class ExpertApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :new, :create]

  def index
    @expert_specialization_list = TalentType.all
  end

  def new
    @expert_specialization_list = TalentType.all
    @expert_application = ExpertApplication.new
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


    private
    def expert_application_params
      params.require(:expert_application).permit(:firstName,:lastName,:email, :phoneNumber, :contactAddress,:shortBio, :talent_type_id, :suggested_skill)
    end
    def talent_type_params
      params.require(:talent_type).permit(:expert_specialization)
    end
end
