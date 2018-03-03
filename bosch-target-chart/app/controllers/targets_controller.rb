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

  private

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
