class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # ログイン成功後のリダイレクト先などの処理
    else
      # ログイン失敗時のエラーメッセージを設定
      flash.now[:danger] = 'メールアドレスまたはパスワードが違います'
      render :new
    end
  end

  # ...その他のアクション
end
