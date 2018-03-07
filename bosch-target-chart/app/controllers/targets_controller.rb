class TargetsController < ApplicationController
  
  before_action :authenticate_user!

  def new
    @target = Target.new
    @departments = Department.all
    @categories  = Category.all
  end

  def create
    target = Target.new(target_params)

    if target.save
      #TODO: Add flash message
    else
      @errors = target.errors
    end
  end

  def update
    @target = Target.find(params[:id])
    
    if @target.update_attributes(target_params)
      assign_attribute_and_value
    else
      @errors = @target.errors
    end
  end

  private

  def assign_attribute_and_value
    @attribute = target_params.keys.first.gsub('_id', '')
    
    if @attribute == 'category'
      @value = Category.find(target_params.values.first).name
    else
      @value = target_params.values.first
    end
  end

  def target_params
    params.require(:target).permit(
        :name,
        :department_id,
        :category_id,
        :unit,
        :update_frequency,
        :comments
      )
  end
end