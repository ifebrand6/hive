class DynamicFormFieldsController < ApplicationController
before_action :set_model, only: [:show,:new,:create]
  def index
  end

  def new
    @model_field = @model_objects.new(model_field_params)
  end

  def create
    @model_field = @model_objects.new(model_field_params)
    if @model_field.save
        redirect_to dynamic_form_field_path(@model_field.target_model)
        flash[:notice] = "Add new field to #{params['target_model']}"
    else 
      render :new
    end
  end
  

  def show
  end

  def edit
    @model_field= Dynabute::Field.find(params[:id])
  end

  def update
    @model_field= Dynabute::Field.find(params[:id])
    if @model_field.update!(model_field_params)
      redirect_to dynamic_form_field_path(@model_field.target_model)
      flash[:notice] = "Update field with name #{@model_field.name}"
    else
        render :edit
    end
  end
  
  def destroy
    @model_field= Dynabute::Field.find(params[:id])
    @model_field.destroy
    redirect_to dynamic_form_field_path(@model_field.target_model)
    flash[:notice] = "Deleted field with name #{@model_field.name}"
  end

  private

  def set_model
    @model_objects = params[:target_model].constantize.dynabutes
  end

  def model_field_params
    params.fetch(:dynabute_field, {}).permit(
      :id,
      :name,
      :target_model,
      :value_type,
      :has_many,
      options_attributes: [:id, :label]
    )
  
  end
  
  
end

