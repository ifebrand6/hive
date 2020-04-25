class ExpertsController < ApplicationController
  before_action :get_talent_types, except: [:accept_application, :show]

  def index
  end
  
  def new
    @expert = Expert.new
  end

  def show
    @expert = Expert.find(params[:id])
  end
  
  def create
    @expert = Expert.new(expert_params)

    if @expert.save
      redirect_to action: "index"
      flash[:notice] = "APPLICATION SUBMITTED SUCCESSFULLY"
    else
      render :new
    end

  end

  def accept_application
    @expert = Expert.find(params[:id])
    @expert.onboarding_expert
    redirect_to dashboard_application_path
  end

private
  def expert_params
    params.require(:expert).permit(:first_name,:last_name,:email, :phone_nubmer, :contact_address,:short_bio, :talent_type_id,:certification, :suggested_skill)
  end

  def get_talent_types
    @expert_specialization_list = TalentType.all
  end
  
end
