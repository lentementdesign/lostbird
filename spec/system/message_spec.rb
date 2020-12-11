require 'rails_helper'
RSpec.describe 'メッセージ管理機能', type: :system do
  describe 'メッセージ登録機能' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:user)
      @pet = FactoryBot.create(:pet, user: @user)
    end
    context 'メッセージを送信した場合' do
      it 'メッセージがページ内に表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: @second_user.email
        fill_in 'user_password', with: @second_user.password
        find('#log_in').click
        visit pet_path(@pet.id)
        click_on "メッセージを送る"
        fill_in 'message_content', with: "最初のメッセージ"
        click_on "投稿する"
        expect(page).to have_content "最初のメッセージ"
      end
    end

    context 'メッセージを送信した場合' do
      it 'メッセージが相手のメッセージ一覧ページにも表示される' do
        visit new_user_session_path
        fill_in 'user_email', with: @second_user.email
        fill_in 'user_password', with: @second_user.password
        find('#log_in').click
        visit pet_path(@pet.id)
        click_on "メッセージを送る"
        fill_in 'message_content', with: "最初のメッセージ"
        click_on "投稿する"
        visit user_path(@second_user.id)
        click_on "ログアウト"
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        find('#log_in').click
        visit rooms_path
        expect(page).to have_content "最初のメッセージ"
      end
    end

  end
end
