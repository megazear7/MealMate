class MealsController < ApplicationController

  def index
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @meal = Meal.find(meal_id)
  end

  def new
  end

  def edit
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @meal = Meal.find(meal_id)
  end

  def create
  end

  def update
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @meal = Meal.find(meal_id)
    @meal.update(meal_params)
  
    if @meal.save
      flash[:notice] = "Successfully updated meal"
      redirect_to plan_meal_path(@meal.plan, @meal)
    else
      flash[:notice] = "Error in updating meal"
      render :action => 'new'
    end
  end

  def destroy
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @meal = Meal.find(meal_id)
    @plan = @meal.plan
  
    if @meal.destroy
      flash[:notice] = "Successfully destroyed meal"
      redirect_to plan_path(@plan)
    else
      flash[:notice] = "Error in destroyed meal"
      render :action => 'new'
    end
  end

  private
    def meal_params
      params.require(:meal).permit(:title, :description, :options_attributes => [:id, :title, :description, :foods_attributes => [:id, :title, :description, :calories, :protien, :fat, :transfat, :monofat, :polyfat, :carbs, :suger, :fiber, :_destroy]])
    end

    def meal_id
      params.require(:id)
    end

end
