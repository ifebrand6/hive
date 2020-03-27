class ExpertApplicationsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @expert_specialization_list = TalentType.all
  end
end
