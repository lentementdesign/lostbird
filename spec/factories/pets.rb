FactoryBot.define do
  factory :pet do
    name { "キーコ" }
    kind { "オカメインコ" }
    lost_gender { "オス" }
    feature { "人懐っこい元気な子です。" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/okame.jpg')) }
    status { 1 }
    lost_day { Time.zone.now }
    prefecture { 1 }
    place { "モエレ沼公園" }
    area { "北海道 モエレ沼公園" }
    latitude { 43.1225258 }
    longitude { 141.4307835 }
    wanted { true }
    user_id { 1 }
    user
  end
  factory :second_pet, class: Pet do
    name { "キーコ" }
    kind { "オカメインコ" }
    lost_gender { "オス" }
    feature { "人懐っこい元気な子です。" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/okame.jpg')) }
    status { 1 }
    lost_day { Time.zone.now }
    prefecture { 2 }
    place { "弘前公園" }
    area { "青森県 弘前公園" }
    latitude { 40.6077066}
    longitude { 140.4643675 }
    wanted { true }
    user_id { 1 }
    user
  end
end
