class FoodsController < ApplicationController

  def index
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @food = Food.find(food_id)
  end

  def new
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    @food = Food.new 
  end

  def edit
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @food = Food.find(food_id)
  end

  def create
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @food = @user.plans.find([:plan_id]).meals.find([:meal_id]).options.find([:option_id]).create(plan_params)
  
    if @food.save
      flash[:notice] = "Successfully created new food"
      redirect_to plan_path(@plan)
    else
      flash[:notice] = "Error in creating new food"
      render :action => 'new'
    end
  end

  def update
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @food = Food.find(food_id)
    @food.update(food_params)
  
    if @food.save
      flash[:notice] = "Successfully updated food"
      redirect_to plan_meal_option_food_path(@food.option.meal.plan, @food.option.meal, @food.option, @food)
    else
      flash[:notice] = "Error in updating food"
      render :action => 'new'
    end
  end

  def destroy
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @food = Food.find(food_id)
    @option = @food.option
  
    if @food.destroy
      flash[:notice] = "Successfully deleted food"
      redirect_to plan_meal_option_path(@option.meal.plan, @option.meal, @option)
    else
      flash[:notice] = "Error in deleteing food"
      render :action => 'new'
    end
  end

  private
    def food_params
      params.require(:food).permit(:title, :description, :calories, :protien, :fat, :transfat, :monofat, :polyfat, :carbs, :suger, :fiber)
    end

    def food_id
      params.require(:id)
    end

end
