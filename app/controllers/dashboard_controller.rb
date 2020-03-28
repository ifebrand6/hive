class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, :except => []
 #before_action :talent_types

  def index
  end

  def application
    @expert_application_list = ExpertApplication.all.pending_application
  end

  def talents
    @expert_application_list = ExpertApplication.all.onboard_expert
  end

  private
     def talent_types
      @talent_types = TalentType.all
     end
end


