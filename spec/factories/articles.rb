FactoryBot.define do
  factory :article do
    title { "私の想い" }
    text  { "誠に有難うございます。" }
  
    association :profile

    after(:build) do |profile|
      profile.image.attach(io: File.open('app/assets/images/camera.png'), filename: 'camera.png')
    end
  end
end
