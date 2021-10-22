require 'rails_helper'

RSpec.describe 'ファッショニスタ管理機能', type: :system do

  describe 'ファッショニスタ登録機能' do
    context 'ファッショニスタが新規登録した場合' do
      before do
        visit new_proposer_registration_path
        fill_in 'proposer_name', with: 'test_proposer'
        fill_in 'proposer_email', with: 'test_proposer@dic.com'
        fill_in 'proposer_password', with: '111111'
        fill_in 'proposer_password_confirmation', with: '111111'
        click_button '新規登録'
      end
      it '登録完了の表示がされる' do
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it 'マイページが表示される' do
        expect(page).to have_content 'test_proposer'
      end
    end
  end

  describe 'セッション機能' do
    before do
      @proposer = Proposer.create(name: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
      visit new_proposer_session_path
      fill_in 'proposer_email', with: 'test@gmail.com'
      fill_in 'proposer_password', with: '123456'
      click_button 'ログイン'
    end
    context 'ファッショニスタがログインをした場合' do
      it 'ログインが表示がされる' do
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'ファッショニスタがログインをした場合' do
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
        @proposer = Proposer.create(name: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        visit new_proposer_session_path
        fill_in 'proposer_email', with: 'test@gmail.com'
        fill_in 'proposer_password', with: '123456'
        click_button 'ログイン'
      end
      it '自身のプロフィールを編集することができる' do
        find(".hamburger").click
        click_link 'マイページ'
        click_link 'Profile'
        click_link 'プロフィール変更'
        fill_in 'proposer_profile', with: 'はじめまして'
        fill_in 'proposer_password', with: '123456'
        fill_in 'proposer_password_confirmation', with: "123456"
        fill_in 'proposer_current_password', with: '123456'
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
  describe 'ゲストログイン機能' do
    before do
      @proposer = Proposer.create(name: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
    end
    context 'ファッショニスタがゲストログインをした場合' do
      it 'ゲストログインができる' do
        visit root_path
        all(".btn")[0].click
        expect(page).to have_content 'ゲストファッショニスタとしてログインしました。'
      end
    end
  end
end