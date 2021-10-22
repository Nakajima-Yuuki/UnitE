require 'rails_helper'

RSpec.describe 'ストック機能', type: :system do

    before do
        @user = FactoryBot.create(:user1)
        @user2 = FactoryBot.create(:user2)
        @proposer = FactoryBot.create(:proposer)
        @proposer2 = FactoryBot.create(:proposer2)
        @outfit = FactoryBot.create(:outfit, proposer_id: @proposer.id)
        @outfit2 = FactoryBot.create(:outfit2, proposer_id: @proposer2.id) 
      end

  describe 'ストック機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
      visit outfit_path(@outfit.id)
      click_link "お気に入りする"
    end
    context '投稿をストックした場合' do
      it 'ストックした投稿が表示される' do
        find(".hamburger").click
        click_link "マイページ"
        expect(page).to have_content 'test_title'
      end
    end
  end
  
  describe 'ストック機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
      visit outfit_path(@outfit.id)
      click_link "お気に入りする"
    end
    context '投稿をストック解除した場合' do
      it 'ストックした投稿が解除される' do
        click_link "お気に入り解除する"
        find(".hamburger").click
        click_link "マイページ"
        expect(page).to have_content 'Profile'
      end
    end
  end
end