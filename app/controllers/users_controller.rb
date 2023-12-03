# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 登録成功後のリダイレクト先などの処理
    else
      # 登録に失敗した場合は、newのビューを再表示
      render :new
    end
  end

  # ...その他のアクション

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana,:first_name_kana, :birth_date)
  end
end
