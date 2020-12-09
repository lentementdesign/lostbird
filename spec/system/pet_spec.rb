require 'rails_helper'
RSpec.describe 'ペット管理機能', type: :system do
  describe '新規作成機能' do
    context 'ペットを新規作成した場合' do
      it '作成したペットが表示される' do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        find("#log_in").click
        visit new_pet_path
        fill_in 'pet_name', with: "キーコ"
        fill_in 'pet_kind', with: "オカメインコ"
        choose 'pet_gender_オス', with: "オス"
        attach_file "pet_image", "spec/fixtures/okame.jpg"
        select "北海道", from: "pet[prefecture]"
        fill_in '淵野辺公園', with: "pet[place]"
        fill_in 'pet[feature]', with: "可愛い鳴き声で泣きます。"
        click_on "保存"
        visit pets_path
        expect(page).to have_content "オカメインコ"
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのペット一覧が表示される' do
        pet = FactoryBot.create(:pet, user: user)
        visit pets_path
        expect(page).to have_content "キーコ"
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当ペットの内容が表示される' do
       end
     end
  end
end
