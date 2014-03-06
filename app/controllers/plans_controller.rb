class PlansController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    @plan = Plan.find(plan_id)
  end

  def new
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @plan = Plan.new
    4.times do
      plan = @plan.meals.build
      4.times do
        option = plan.options.build
        option.foods.build
      end
    end
  end

  def edit
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @plan = Plan.find(plan_id)
  end

  def create
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @plan = @user.plans.create(plan_params)
  
    if @plan.save
      flash[:notice] = "Successfully created new plan"
      redirect_to plan_path(@plan)
    else
      flash[:notice] = "Error in creating new plan"
      render :action => 'new'
    end
  end

  def update
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @plan = Plan.find(plan_id)
    @plan.update(plan_params)
  
    if @plan.save
      flash[:notice] = "Successfully updated new plan"
      redirect_to plan_path(@plan)
    else
      flash[:notice] = "Error in updating new plan"
      render :action => 'new'
    end
  end

  def destroy
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @plan = Plan.find(plan_id)
  
    if @plan.destroy
      flash[:notice] = "Successfully destroyed new plan"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Error in destroyed new plan"
      render :action => 'new'
    end
  end

  private
    def plan_params
      params.require(:plan).permit(:title, :description, :meals_attributes => [:id, :title, :description, :options_attributes => [:id, :title, :description, :foods_attributes => [:id, :title, :description, :calories, :protien, :fat, :transfat, :monofat, :polyfat, :carbs, :suger, :fiber, :_destroy]]])
    end

    def plan_id
      params.require(:id)
    end


end
