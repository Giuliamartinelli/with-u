class AngelsController < ApplicationController
  def new
    @angel = Angel.new
  end

  def create
    @angel = Angel.new(params_allowed)
    @angel.user_id = current_user.id
    @angel.phone_number = @angel.phone_number.gsub(/\s+/, "")
    if @angel.save
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def edit
    @angel = Angel.find(params[:id])
  end

  def update
    @angel = Angel.find(params[:id])
    if @angel.update(params_allowed)
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  def destroy
    @angel = Angel.find(params[:id])
    @angel.destroy
    redirect_to profile_path
  end

  private

  def params_allowed
    params.require(:angel).permit(:name, :phone_number, :user_id)
  end
end
