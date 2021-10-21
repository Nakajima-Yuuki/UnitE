require 'rails_helper'


RSpec.describe 'ファッショニスタ登録機能', type: :model do

  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        proposer = FactoryBot.create(:proposer1)
        proposer.name = ""
        expect(proposer).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションに引っかかる' do
        proposer = FactoryBot.create(:proposer1)
        proposer.email = ""
        expect(proposer).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        proposer = FactoryBot.create(:proposer1)
        proposer.password = ""
        expect(proposer).not_to be_valid
      end
    end
    context '名前が20文字以上の場合' do
      it 'バリデーションに引っかかる' do
        proposer = FactoryBot.create(:proposer1)
        proposer.name = "a" * 25
        expect(proposer).not_to be_valid
      end
    end
    context 'メールアドレスが50文字以上の場合' do
      it 'バリデーションに引っかかる' do
        proposer = FactoryBot.create(:proposer1)
        proposer.email = "a" * 50 + "@" + "gmail.com"
        expect(proposer).not_to be_valid
      end
    end
    context 'メールアドレスが50文字以下の場合' do
      it '登録される' do
        proposer = FactoryBot.create(:proposer1)
        proposer.email = "a" * 40 + "@" + "gmail.com"
        expect(proposer).to be_valid
      end
    end
    context '名前とメールアドレスとパスワードが内容が入力されている場合' do
      it '登録される' do
        proposer = Proposer.new(name: "test", email: "test@gmail.com", password: "123456", password_confirmation: "123456")
        expect(user).to be_valid
      end
    end
  end
end
