class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @conversations = Conversation.participating(current_user).order('updated_at DESC').first(3)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def profiles
    @user = User.find_by(id: params[:id])
  end

end