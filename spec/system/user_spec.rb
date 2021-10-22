require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do

  describe 'ユーザー登録機能' do
    context 'ユーザーを新規登録した場合' do
      before do
        visit new_user_registration_path
        fill_in 'user_username', with: 'test_user'
        fill_in 'user_email', with: 'test_user@dic.com'
        fill_in 'user_password', with: '111111'
        fill_in 'user_password_confirmation', with: '111111'
        click_button '新規登録'
      end
      it '登録完了の表示がされる' do
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it 'マイページが表示される' do
        expect(page).to have_content 'test_user'
      end
    end
  end

  describe 'セッション機能' do
    before do
      @user = User.create(username: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
      visit new_user_session_path
      fill_in 'user_email', with: 'test@gmail.com'
      fill_in 'user_password', with: '123456'
      click_button 'ログイン'
    end
    context 'ユーザーがログインをした場合' do
      it 'ログインが表示がされる' do
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'ユーザーがログインをした場合' do
      it 'マイページに行ける' do
        find(".hamburger").click
        click_link 'マイページ'
        expect(page).to have_content 'test'
      end
    end
  end
  
  describe 'ログイン確認機能' do
    context 'ログイン後アカウント編集' do
      before do
        @user = User.create(username: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        visit new_user_session_path
        fill_in 'user_email', with: 'test@gmail.com'
        fill_in 'user_password', with: '123456'
        click_button 'ログイン'
      end
      it '自身のプロフィールを編集することができる' do
        find(".hamburger").click
        click_link 'マイページ'
        click_link 'Profile'
        click_link 'プロフィール変更'
        fill_in 'user_profile', with: 'はじめまして'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: "123456"
        fill_in 'user_current_password', with: '123456'
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
      it 'ログインアウトを実行できる' do
        find(".hamburger").click
        click_link 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
      end
    end
  end 
  describe '管理画面のテスト' do
    before do
      @user = User.create(username: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456", admin: "true")
      @user_second = User.create(username: "test2", email: "test2@gmail.com", password: "123456", password_confirmation: "123456", admin: "false" )
      visit new_user_session_path
    end
    context '管理ユーザは管理画面にアクセスできること' do
      
      it '管理ユーザは管理画面にアクセスできること' do
        fill_in 'user_email', with: 'test@gmail.com'
        fill_in 'user_password', with: '123456'
        click_button 'ログイン'
        find(".hamburger").click
        click_link 'マイページ'
        click_link 'Profile'
        click_link '管理者ログイン'
        expect(page).to have_content 'サイト管理'
      end
    end
    context '一般ユーザは管理画面にアクセスできないこと' do
      it '一般ユーザは管理画面にアクセスできないこと' do
        visit new_user_session_path
        fill_in 'user_email', with: 'test2@gmail.com'
        fill_in 'user_password', with: '123456'
        click_button 'ログイン'
        find(".hamburger").click
        click_link 'マイページ'
        click_link 'Profile'
        expect(page).to have_content 'プロフィール変更'
      end
    end
  end
  describe 'ゲストログイン機能' do
    before do
      @user = User.create(username: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456", admin: "true")
      @user_second = User.create(username: "test2", email: "test2@gmail.com", password: "123456", password_confirmation: "123456", admin: "false" )
    end
    context 'ユーザーがゲストログインをした場合' do
      it 'ゲストログインができる' do
        visit root_path
        # click_on 'ログイン'
        all(".btn")[1].click
        expect(page).to have_content 'ゲストユーザーとしてログインしました'
      end
    end
  end
end