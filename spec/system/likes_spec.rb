require 'rails_helper'

RSpec.describe 'いいね機能', type: :system do

  before do
    @user = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @proposer = FactoryBot.create(:proposer)
    @proposer2 = FactoryBot.create(:proposer2)
    @outfit = FactoryBot.create(:outfit, proposer_id: @proposer.id)
    @outfit2 = FactoryBot.create(:outfit2, proposer_id: @proposer2.id) 
  end

  describe 'いいねマーク' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
      first(".like-btn").click
    end
    context '投稿にいいねをつけた場合' do
      it '1が表示される' do
        sleep 1.0
        expect(first('.text-muted').text).to have_content 1
      end
    end
  end
  
  describe 'いいねマーク', js: true do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
    end
    context 'いいねを外す' do
      it '0が表示される' do
        all(".like-link")[1].click
        sleep 1.0
        all(".like-link")[1].click
        sleep 1.0
        expect(first('.text-muted').text).to have_content 0
      end
    end
  end
end