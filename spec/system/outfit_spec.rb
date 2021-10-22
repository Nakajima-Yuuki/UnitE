require 'rails_helper'

RSpec.describe '投稿機能', type: :system do
    before do
        @proposer = FactoryBot.create(:proposer)
        @proposer2 = FactoryBot.create(:proposer2)
        @outfit = FactoryBot.create(:outfit, proposer_id: @proposer.id)
        @outfit2 = FactoryBot.create(:outfit2, proposer_id: @proposer2.id) 
    end
    describe '新規作成機能' do
        before do
          visit new_proposer_session_path
          fill_in 'proposer_email', with: 'proposer01@gmail.com'
          fill_in 'proposer_password', with: '111111'
          click_button 'ログイン' 
          find(".hamburger").click
          click_link "新規投稿"
          fill_in "outfit_title", with: "test_title"
          fill_in "outfit_content", with: "test_content"
          attach_file 'outfit_image', "#{Rails.root}/spec/images/test.jpg"
          click_button '登録する'
        end
    
        context '投稿を新規作成した場合' do
          it '作成した投稿が表示される' do
            expect(page).to have_content 'test_title'
          end
        end
      end
      describe '投稿一覧機能' do
        before do
          visit new_proposer_session_path
          fill_in 'proposer_email', with: 'proposer01@gmail.com'
          fill_in 'proposer_password', with: '111111'
          click_button 'ログイン' 
          binding.irb
          visit outfits_path
        end
        context '一覧画面に遷移した場合' do
          it '作成済みのタスク一覧が表示される' do 
            expect(page).to have_content 'test_title'
            expect(page).to have_content @proposer.name
          end
        end
        context '任意投稿の詳細画面に遷移した場合' do
          it '内容が表示される' do
            visit outfit_path(@outfit)
            expect(page).to have_content 'test_content'
          end
        end
      end
      describe '投稿編集機能' do
        before do
          visit new_proposer_session_path
          fill_in 'proposer_email', with: 'proposer01@gmail.com'
          fill_in 'proposer_password', with: '111111'
          click_button 'ログイン' 
          visit outfits_path
        end
        context '編集をした場合' do
          it '編集の内容が表示される' do 
            visit outfit_path(@outfit.id)
            click_link "編集"
            fill_in "outfit_title", with: "edit_title"
            click_button '更新する'
            expect(page).to have_content 'edit_title'
          end
        end
    
      describe '投稿削除機能' do
        context '投稿を削除した場合' do      
          it '削除表示がされる' do
            visit outfits_path
            all('.card-img-top')[1].click
            # visit outfits_path(@outfit.id)
            click_link '削除'
            # expect {
            #   page.accept_confirm "本当に削除しますか？"
            # #   expect(page).to have_content "本当に削除しますか？"
            # }#.to change { Outfit.count }.by(-1)
            page.driver.browser.switch_to.alert.accept
            expect(page).to have_content '投稿を削除しました'
            end
          end
        end
      end
    
      describe '検索機能' do
        before do
          visit new_proposer_session_path
          fill_in 'proposer_email', with: 'proposer01@gmail.com'
          fill_in 'proposer_password', with: '111111'
          click_button 'ログイン' 
        end
        context '検索をした場合' do
          it "検索キーワードを含む記事で絞り込まれる" do
            fill_in 'q[title_or_content_cont]', with: 'test_title'
            click_button '検索'
            expect(page).to have_content 'test_title'
          end
          it "検索キーワードを含まない記事は表示されない" do
            fill_in 'q[title_or_content_cont]', with: 'test_title'
            click_button '検索'
            expect(page).not_to have_content 'outfit_a'
          end
        end
      end

end