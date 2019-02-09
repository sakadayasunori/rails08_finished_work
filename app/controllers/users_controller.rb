class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    # ↓Ruby04のセキュリティのところで変更する以前の形
    # @user = User.new(name: params[:user][:name], email: params[:user][:email])
    # 変更後
    @user = User.new(user_parmas)
    #debugger
    # logger('#####user',@user)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger]="登録に失敗しました"
      render :new
    end
  end

  # Rails05のセキュリティのところ
  private
  def user_parmas
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
