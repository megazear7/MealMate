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
    @plan = Plan.find(plan_id)
  end

  def new
    if user_signed_in?
      @user = current_user
    end
  
    @plan = Plan.new
    4.times { @plan.meals.build }

    @plan.meals.each do |u|
      4.times { u.options.build }
      u.options.each do |o|
        o.foods.build
      end
    end

  end

  def edit
  end

  def create
    if user_signed_in?
      @user = current_user
    end
  
    @plan = @user.plans.create(plans_params)
  
    aa

    if @plan.save
      flash[:notice] = "Successfully created new plan"
      redirect_to plan_path(@plan)
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
      params.require(:plan).permit(:title, :description, :meals_attributes => [:id, :title, :description, :options_attributes => [:id, :title, :description, :foods_attributes => [:id, :title, :description, :calories, :protien, :fat, :transfat, :monofat, :polyfat, :carbs, :suger, :fiber, :_destroy]]])
    end

    def plan_id
      params.require(:id)
    end


end
