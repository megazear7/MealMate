class PlansController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
    end
  end

  def show
    if user_signed_in?
      @user = current_user
    end
  end

  def new
    if user_signed_in?
      @user = current_user
    end
  
    @plan = Plan.new
    (1..4).each do |u|
      @plan.meals.build
    end

    @plan.meals.each do |u|
      u.options.build
    end

  end

  def edit
  end

  def create
    if user_signed_in?
      @user = current_user
    end
  
    @plan = @user.plans.create(plans_params)

    if @plan.save
      flash[:notice] = "Successfully created new plan"
      redirect_to plans_path(@plan)
    else
      flash[:notice] = "Error in creating new plan"
      render :action => 'new'
    end
  end

  def update
  end

  def destroy
  end

  private
   def plans_params
      params.require(:plan).permit(:title, :description, :_destroy, meals_attributes: [:id, :title, :description, options_attributes: [:id, :title, :description, :_destroy, foods_attributes: [:id, :title, :description, :calories, :protien, :fat, :transfat, :monofat, :polyfat, :carbs, :suger, :fiber, :_destroy]]])
   end

end
