FactoryBot.define do
  factory :profile do
    name       { "佐藤ましろ" }
    store_name { "イタリアン 〜mashiro〜" }
    store_url  { "https://example.com" }
    text       { "心よりお待ちしております。" }

    association :user

    after(:build) do |profile|
      profile.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
