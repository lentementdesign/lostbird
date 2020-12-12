require 'rails_helper'
RSpec.describe 'ペット管理機能', type: :system do

  describe '検索機能' do
    before do
      user = FactoryBot.create(:user)
      pet = FactoryBot.create(:pet, user: user)
    end
    context 'ペットの種類であいまい検索をした場合' do
      it "検索キーワードを含む種類のペットで絞り込まれる" do
        visit pets_path
        fill_in 'kind_name', with: 'オカメインコ'
        click_on "検索"
        expect(page).to have_content 'オカメインコ'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するペットが絞り込まれる" do
        visit pets_path
        select '迷子'
        click_on "検索"
        expect(find(".pet_kind")).to have_content '迷子'
      end
    end
    context '都道府県検索をした場合' do
      it "都道府県に完全一致するペットが絞り込まれる" do
        visit pets_path
        select '北海道'
        click_on "検索"
        expect(find(".pet_area")).to have_content '北海道'
      end
    end
    context 'ステータス検索とペットの種類であいまい検索をした場合' do
      it "検索キーワードを含む種類、かつ検索キーワードを含む種類のペット絞り込まれる" do
        visit pets_path
        select '迷子'
        fill_in 'kind_name', with: 'オカメインコ'
        click_on "検索"
        expect(find(".pet_kind")).to have_content '迷子'
        expect(find(".pet_kind")).to have_content 'オカメインコ'
      end
    end
    context 'ステータス検索と都道府県で検索をした場合' do
      it "ステータスに完全一致する、かつ都道府県に完全一致するペット絞り込まれる" do
        visit pets_path
        select '迷子'
        select '北海道'
        click_on "検索"
        expect(find(".pet_kind")).to have_content '迷子'
        expect(find(".pet_area")).to have_content '北海道'
      end
    end
    context '都道府県検索とペットの種類であいまい検索をした場合' do
      it "都道府県に完全一致する、かつ検索キーワードを含む種類のペット絞り込まれる" do
        visit pets_path
        select '北海道'
        fill_in 'kind_name', with: 'オカメインコ'
        click_on "検索"
        expect(find(".pet_area")).to have_content '北海道'
        expect(find(".pet_kind")).to have_content 'オカメインコ'
      end
    end
    context 'ステータス検索と都道府県検索とペットの種類であいまい検索をした場合' do
      it "ステータスに完全一致する、かつ都道府県に完全一致する、かつ検索キーワードを含む種類のペット絞り込まれる" do
        visit pets_path
        select '迷子'
        select '北海道'
        fill_in 'kind_name', with: 'オカメインコ'
        click_on "検索"
        expect(find(".pet_kind")).to have_content '迷子'
        expect(find(".pet_area")).to have_content '北海道'
        expect(find(".pet_kind")).to have_content 'オカメインコ'
      end
    end
  end

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
        fill_in 'pet_kind', with: "イエローインコ"
        choose 'pet_lost_gender_オス', with: "オス"
        attach_file "pet_image", "spec/fixtures/okame.jpg"
        select "北海道", from: "pet[prefecture]"
        fill_in '淵野辺公園', with: "pet[place]"
        fill_in 'pet[feature]', with: "可愛い鳴き声で泣きます。"
        click_on "保存"
        visit pets_path
        expect(page).to have_content "イエローインコ"
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのペット一覧が表示される' do
        user = FactoryBot.create(:user)
        pet = FactoryBot.create(:pet, user: user)
        visit pets_path
        expect(page).to have_content "オカメインコ"
      end
    end
  end
  describe '詳細表示機能' do
     context 'ペット詳細画面に遷移した場合' do
       it '該当ペットの内容が表示される' do
         user = FactoryBot.create(:user)
         pet = FactoryBot.create(:pet, user: user)
         visit pet_path(pet.id)
         expect(page).to have_content "人懐っこい元気な子です。"
       end
     end
  end
end
