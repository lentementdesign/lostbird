require 'rails_helper'
RSpec.describe 'ペットモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context 'ペットの性別が空の場合' do
      it 'バリデーションにひっかかる' do
        @user = FactoryBot.create(:user)
        pet = Pet.new(name: "キーコ",
                      kind: "オカメインコ",
                      gender: "",
                      feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
                      image: open("./db/fixtures/okame.jpg"),
                      status: 1,
                      lost_day: Time.zone.now,
                      prefecture: 1,
                      place: "モエレ沼公園",
                      area: "北海道 モエレ沼公園",
                      latitude: 43.1225258,
                      longitude: 141.4307835,
                      wanted: true,
                      user_id:1)
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの特徴が空の場合' do
      it 'バリデーションにひっかかる' do
        @user = FactoryBot.create(:user)
        pet = Pet.new(name: "キーコ",
                      kind: "オカメインコ",
                      gender: "オス",
                      feature: "",
                      image: open("./db/fixtures/okame.jpg"),
                      status: 1,
                      lost_day: Time.zone.now,
                      prefecture: 1,
                      place: "モエレ沼公園",
                      area: "北海道 モエレ沼公園",
                      latitude: 43.1225258,
                      longitude: 141.4307835,
                      wanted: true,
                      user_id:1)
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの写真が空の場合' do
      it 'バリデーションにひっかかる' do
        @user = FactoryBot.create(:user)
        pet = Pet.new(name: "キーコ",
                      kind: "オカメインコ",
                      gender: "オス",
                      feature: "",
                      image: "",
                      status: 1,
                      lost_day: Time.zone.now,
                      prefecture: 1,
                      place: "モエレ沼公園",
                      area: "北海道 モエレ沼公園",
                      latitude: 43.1225258,
                      longitude: 141.4307835,
                      wanted: true,
                      user_id:1)
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの特徴などが空の場合' do
      it 'バリデーションにひっかかる' do
        @user = FactoryBot.create(:user)
        pet = Pet.new(name: "キーコ",
                      kind: "オカメインコ",
                      gender: "オス",
                      feature: "",
                      image: open("./db/fixtures/okame.jpg"),
                      status: 1,
                      lost_day: Time.zone.now,
                      prefecture: 1,
                      place: "モエレ沼公園",
                      area: "北海道 モエレ沼公園",
                      latitude: 43.1225258,
                      longitude: 141.4307835,
                      wanted: true,
                      user_id:1)
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの受付中かどうかが空の場合' do
      it 'バリデーションにひっかかる' do
        @user = FactoryBot.create(:user)
        pet = Pet.new(name: "キーコ",
                      kind: "オカメインコ",
                      gender: "オス",
                      feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
                      image: open("./db/fixtures/okame.jpg"),
                      status: 1,
                      lost_day: Time.zone.now,
                      prefecture: 1,
                      place: "モエレ沼公園",
                      area: "北海道 モエレ沼公園",
                      latitude: 43.1225258,
                      longitude: 141.4307835,
                      wanted: "",
                      user_id:1)
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの性別、特徴、写真、迷子かどうか、受付中かどうかが入力されている場合' do
      it 'バリデーションに通る' do
        @user = FactoryBot.create(:user)
        pet = Pet.new(name: "キーコ",
                      kind: "オカメインコ",
                      gender: "オス",
                      feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
                      image: open("./db/fixtures/okame.jpg"),
                      status: 1,
                      lost_day: Time.zone.now,
                      prefecture: 1,
                      place: "モエレ沼公園",
                      area: "北海道 モエレ沼公園",
                      latitude: 43.1225258,
                      longitude: 141.4307835,
                      wanted: true,
                      user_id:1)
        expect(pet).not_to be_valid
      end
    end
  end


  describe '検索機能' do
    let!(:pet) { FactoryBot.create(:pet, kind: 'A型', prefecture: "北海道") }
    let!(:second_pet) { FactoryBot.create(:second_pet, kind: "B型", prefecture: "宮城県") }
    context 'scopeメソッドで種類のあいまい検索をした場合' do
      it "検索キーワードを含む種類のペットが絞り込まれる" do
        expect(Pet.kind_like('A型')).to include(pet)
        expect(Pet.kind_like('A型')).not_to include(second_pet)
        expect(Pet.kind_like('A型').count).to eq 1
      end
    end
    context 'scopeメソッドで都道府県検索をした場合' do
      it "都道府県に完全一致するペットが絞り込まれる" do
        expect(Pet.prefecture_match('北海道')).to include(pet)
        expect(Pet.prefecture_match('北海道')).not_to include(second_pet)
        expect(Pet.prefecture_match('北海道').count).to eq 1
      end
    end
    context 'scopeメソッドで種類のあいまい検索と都道府県検索をした場合' do
      it "検索キーワードを種類に含み、かつ都道府県に完全一致するペット絞り込まれる" do
        expect(Pet.kind_like('A型').prefecture_match('北海道')).to include(pet)
        expect(Pet.kind_like('A型').prefecture_match('北海道')).not_to include(second_pet)
        expect(Pet.kind_like('A型').prefecture_match('北海道').count).to eq 1
      end
    end
  end
end
