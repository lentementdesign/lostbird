10.times do |i|
  User.create!(nickname: "ユーザー#{i+1}",
              email: "ippan#{i+1}@user.com",
              password: "password02",
              password_confirmation: "password02"
              )
end

# 迷子
Pet.create!(name: "キーコ",
            kind: "オカメインコ",
            lost_gender: "オス",
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
            user_id:1
            )
Pet.create!(name: "フクちゃん",
            kind: "日本フクロウ",
            lost_gender: "メス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/fukurou.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 2,
            place: "弘前公園",
            area: "青森県 弘前公園",
            latitude: 40.6077066,
            longitude: 140.4643675,
            wanted: true,
            user_id:2
            )
# 保護
Pet.create!(kind: "ブルーインコ",
            find_gender: "オス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/blue.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 6,
            place: "西公園",
            area: "山形県 西公園",
            latitude: 38.2443773,
            longitude: 140.2822551,
            wanted: true,
            user_id:6
            )
Pet.create!(kind: "セキセイインコ",
            find_gender: "メス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/sekisei2.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 5,
            place: "千秋公園",
            area: "秋田県 千秋公園",
            latitude: 38.3680814,
            longitude: 140.927563,
            wanted: true,
            user_id:4
            )
#迷子
Pet.create!(name: "くうちゃん",
            kind: "ヨウム",
            lost_gender: "オス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/youmu.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 3,
            place: "ふれあいの丘公園",
            area: "岩手県 ふれあいの丘公園",
            latitude: 39.1287669,
            longitude: 141.1977705,
            wanted: true,
            user_id:3
            )
Pet.create!(name: "Qちゃん",
            kind: "セキセイインコ",
            lost_gender: "メス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/sekisei.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 4,
            place: "宮城県",
            area: "宮城県 大亀山森林公園",
            latitude: 38.3680814,
            longitude: 140.927563,
            wanted: true,
            user_id:4
            )
Pet.create!(name: "トマト",
            kind: "オカメインコ",
            lost_gender: "オス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/tomato.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 5,
            place: "千秋公園",
            area: "秋田県 千秋公園",
            latitude: 38.3680814,
            longitude: 140.927563,
            wanted: true,
            user_id:5
            )
Pet.create!(name: "キーコ",
            kind: "イエローインコ",
            lost_gender: "オス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/yellow.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 6,
            place: "西公園",
            area: "山形県 西公園",
            latitude: 38.2443773,
            longitude: 140.2822551,
            wanted: true,
            user_id:1
            )
# 保護
Pet.create!(kind: "オカメインコ",
            find_gender: "オス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/okame2.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 6,
            place: "西公園",
            area: "山形県 西公園",
            latitude: 38.2443773,
            longitude: 140.2822551,
            wanted: true,
            user_id:6
            )
Pet.create!(kind: "オウム",
            find_gender: "メス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/oumu.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 5,
            place: "千秋公園",
            area: "秋田県 千秋公園",
            latitude: 38.3680814,
            longitude: 140.927563,
            wanted: true,
            user_id:4
            )
Pet.create!(kind: "インコ",
            find_gender: "オス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/inko.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 4,
            place: "宮城県",
            area: "宮城県 大亀山森林公園",
            latitude: 38.3680814,
            longitude: 140.927563,
            wanted: true,
            user_id:1
            )
Pet.create!(kind: "七色インコ",
            find_gender: "メス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/color.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 3,
            place: "ふれあいの丘公園",
            area: "岩手県 ふれあいの丘公園",
            latitude: 39.1287669,
            longitude: 141.1977705,
            wanted: true,
            user_id:2
            )
Pet.create!(kind: "オウム",
            find_gender: "オス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/oumu2.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 2,
            place: "弘前公園",
            area: "青森県 弘前公園",
            latitude: 40.6077066,
            longitude: 140.4643675,
            wanted: true,
            user_id:1
            )
Pet.create!(kind: "イエローインコ",
            find_gender: "メス",
            feature: "公園で遊んでいたところ、急に肩にとまったので、びっくりしました。鳴き声も可愛く、人懐っこい元気な子です。",
            image: open("./db/fixtures/yellow2.jpg"),
            status: 2,
            find_day: Time.zone.now,
            prefecture: 1,
            place: "モエレ沼公園",
            area: "北海道 モエレ沼公園",
            latitude: 43.1225258,
            longitude: 141.4307835,
            wanted: true,
            user_id:3
            )

# 迷子
Pet.create!(name: "ペロー",
            kind: "オカメインコ",
            lost_gender: "メス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/okame3.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 1,
            place: "モエレ沼公園",
            area: "北海道 モエレ沼公園",
            latitude: 43.1225258,
            longitude: 141.4307835,
            wanted: true,
            user_id:1
            )
Pet.create!(name: "プー太",
            kind: "鶏",
            gender: "オス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/niwatori.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 2,
            place: "弘前公園",
            area: "青森県 弘前公園",
            latitude: 40.6077066,
            longitude: 140.4643675,
            wanted: true,
            user_id:5
            )
Pet.create!(name: "チョップ",
            kind: "グリーンインコ",
            lost_gender: "オス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/greenbird.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 3,
            place: "ふれあいの丘公園",
            area: "岩手県 ふれあいの丘公園",
            latitude: 39.1287669,
            longitude: 141.1977705,
            wanted: true,
            user_id:1
            )
Pet.create!(name: "ポモス",
            kind: "オウム",
            lost_gender: "メス",
            feature: "人懐っこい元気な子です。公園でフライトスーツをつけて一緒に遊んでいたのですが、スーツのハーネスが取れて飛んでいってしまいました。大切な家族なので、途方にくれています。",
            image: open("./db/fixtures/oumu3.jpg"),
            status: 1,
            lost_day: Time.zone.now,
            prefecture: 1,
            place: "モエレ沼公園",
            area: "北海道 モエレ沼公園",
            latitude: 43.1225258,
            longitude: 141.4307835,
            wanted: true,
            user_id:1
            )
