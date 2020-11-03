class AngelsController < ApplicationController
  def new
    @angel = Angel.new
  end

  def create
    @angel = Angel.new(params_allowed)
    @angel.user_id = current_user.id
    if @angel.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def params_allowed
    params.require(:angel).permit(:name, :phone_number, :user_id)
  end
end
