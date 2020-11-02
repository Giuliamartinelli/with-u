class AngelsController < ApplicationController
  def new
    @angel = Angel.new
  end

  def create
    @angel = Angel.new(params_allowed)
    @angel.user = current_user
    if @angel.save
      redirect_to profile_path(current_user)
    else
      render 'new'
    end
  end

  def params_allowed
    params.require(:angel).permit(:name, :phone_number)
  end
end
