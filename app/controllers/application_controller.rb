class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
  #before_action :authenticate_user!
  #before_action :authenticate_proposer!
  def autheniticate_user
    if @current_user==nil
      flash[:notice]="ログインが必要です"
      redirect_to("/login")
    end
  end

  def autheniticate_proposer
    if @current_proposer==nil
      flash[:notice]="ログインが必要です"
      redirect_to("/login")
    end
  end


  def after_sign_in_path_for(resource)
    case resource
    when User
      outfits_path
    when Proposer
      outfits_path
    when Admin
      outfits_path
    end
  end

    # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?


  
  protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :profile, :avatar])
    end  
end
