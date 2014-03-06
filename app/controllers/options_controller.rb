class OptionsController < ApplicationController

  def index
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    @option = Option.find(option_id)
  end

  def new
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
    @option = Option.new
    @option.foods.build
  end

  def edit
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end

    @option = Option.find(option_id)
  end

  def create
  end

  def update
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_session_path
    end
  
    @option = Option.find(option_id)
    @option.update(option_params)
  
    if @option.save
      flash[:notice] = "Successfully updated option"
      redirect_to plan_meal_option_path(@option.meal.plan, @option.meal, @option)
    else
      flash[:notice] = "Error in updating option"
      render :action => 'new'
    end
  end

  def destroy
  end

  private
    def option_params
      params.require(:option).permit(:title, :description, :foods_attributes => [:id, :title, :description, :calories, :protien, :fat, :transfat, :monofat, :polyfat, :carbs, :suger, :fiber, :_destroy])
    end

    def option_id
      params.require(:id)
    end



end
