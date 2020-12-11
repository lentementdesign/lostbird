require 'rails_helper'
RSpec.describe 'ペットモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context 'ユーザーのニックネームが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(nickname: "",
                        email: "ippan1@user.com",
                        password: "password02",
                        password_confirmation: "password02"
                        )
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(nickname: "ユーザー2",
                        email: "",
                        password: "password02",
                        password_confirmation: "password02"
                        )
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(nickname: "ユーザー3",
                        email: "ippan3@user.com",
                        password: "",
                        password_confirmation: ""
                        )
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのニックネーム、メールアドレス、パスワードが正しく入力されている場合' do
      it 'バリデーションに通る' do
        user = User.new(nickname: "ユーザー4",
                        email: "ippan4@user.com",
                        password: "password02",
                        password_confirmation: "password02"
                        )
        expect(user).to be_valid
      end
    end
  end
end
