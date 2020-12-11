require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  describe 'ユーザ登録機能' do
    context 'ユーザーが新規登録した場合' do
      it 'ユーザー詳細ページが作成される' do
        visit new_user_registration_path
        fill_in 'user_nickname', with: "テストユーザー"
        fill_in 'user_email', with: "ass@yahoo.co.jp"
        fill_in 'user_password', with: "mystring"
        fill_in 'user_password_confirmation', with: "mystring"
        click_on "登録"
        expect(page).to have_content "テストユーザー"
      end
      it 'ユーザーがログインせずペット登録ページに飛ぼうとしたとき、ユーザー登録ページに遷移すること' do
        visit new_pet_path
        expect(current_path).to eq new_user_registration_path
      end
    end
  end

  describe 'セッション機能' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:user)
    end
    context 'ユーザーがログインした場合' do
      it 'ユーザー自身の詳細ページへ遷移できる' do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        find('#log_in').click
        visit user_path(@user.id)
        expect(current_path).to eq user_path(@user.id)
      end
    end
    context '一般ユーザーが他人の詳細ページへ飛ぶと' do
      it 'タスク一覧画面へ飛ばされる' do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        find('#log_in').click
        visit user_path(@second_user.id)
        expect(current_path).to eq pets_path
      end
    end
    context 'ログアウトボタンをクリックすると' do
      it 'ログアウトのメッセージが表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        find('#log_in').click
        visit user_path(@user.id)
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました。"
      end
    end
  end
end
