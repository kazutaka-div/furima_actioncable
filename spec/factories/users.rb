FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    # '1a' には意味はない。ただ半角英数字をFakerの中に入れるため。
    password = '1a' + Faker::Internet.password(min_length: 4, max_length: 20)
    password { password }
    password_confirmation { password }
    email { Faker::Internet.email }
    # 誕生日は一意性ではないよ
    birth_date { "1996-10-10" }
    first_name { '田中' }
    last_name { '太郎' }
    first_name_kana { 'タナカ' }
    last_name_kana { 'タロウ' }
  end
end
