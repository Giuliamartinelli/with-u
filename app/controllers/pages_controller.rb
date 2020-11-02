class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :incoming ]

  def incoming

  end

  def profile
    @user = current_user
    @angels = Angel.where("user_id = current_user.id")
  end

  def tutorial

  end

  def fakecall

  end
end
