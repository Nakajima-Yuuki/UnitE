require 'rails_helper'

RSpec.describe '投稿機能', type: :model do

  describe 'バリデーションのテスト' do
    before do
      @proposer = FactoryBot.create(:proposer)
    end
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do
        outfit = Outfit.new(title: '', content: '失敗テスト')
        expect(outfit).not_to be_valid
      end
    end
    context '投稿の詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        outfit = Outfit.new(title: "失敗テスト", content: "")
        expect(outfit).to be_invalid
      end
    end
    context '投稿のタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        #@userはbeforeで作ったインスタンス変数
        outfit = Outfit.new(title: "テスト", content: "成功", proposer_id: @proposer.id)
        expect(outfit).to be_valid
      end
    end
  end
end
