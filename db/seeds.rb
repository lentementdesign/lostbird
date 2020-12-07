10.times do |i|
  User.create!(nickname: "ユーザー#{i+1}",
              email: "ippan#{i+1}@user.com",
              password: "password02",
              password_confirmation: "password02"
              )
end

# 迷子
Pet.create!(name: "太郎",
            kind: "オカメインコ",
            gender: "オス,
            feature: "羽の抜けやすい子です。",
            image: open("./db/fixtures/pet1.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 1,
            place: "モエレ沼公園",
            area: "北海道 モエレ沼公園",
            latitude: 43.1225258,
            longitude: 141.4307835,
            wanted: true
            )
