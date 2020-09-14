class UsersController < ApplicationController
  def index
    # @users = User.all.order(created_at: :desc)

    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User #{@user.email} was successfully updated.'
    else
      render :edit
    end
  end
end
