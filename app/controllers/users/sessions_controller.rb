# frozen_string_literal: true
#module Users
  class Users::SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]
    before_action :ensure_not_proposer

    def guest_sign_in
      user = User.guest
      sign_in user
      redirect_to outfits_path, notice: 'ゲストユーザーとしてログインしました'
    end

    def ensure_not_proposer
      redirect_to outfits_path, notice: 'アクセス権限がありません' if current_proposer.present?
    end
    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
