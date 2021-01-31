require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end
  

  describe "プロフィール登録" do
    context "成功する場合" do
      it "記入欄全てに正しい値が存在する" do
        expect(@profile).to be_valid
      end
    end
  
  

    context "失敗する場合" do
      it "画像が添付されていない" do
        @profile.image = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("画像を入力してください")
      end

    
      it "ユーザーの名前が空欄" do
        @profile.name = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("お名前を入力してください")
      end
    

      it "お店の名前が空欄" do
        @profile.store_name = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("お店の名前を入力してください")
      end
    

      it "お店のURLが空欄" do
        @profile.store_url = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("お店のURLを入力してください")
      end
    

      it "お店のURLに(http https)のどちらも含まれていない" do
        @profile.store_url = "example.com"
        @profile.valid?
        expect(@profile.errors.full_messages).to include("お店のURLは不正な値です")
      end


      it "お店のURLの(http https)が最初に含まれていない" do
        @profile.store_url = "example.com//https"
        @profile.valid?
        expect(@profile.errors.full_messages).to include("お店のURLは不正な値です")
      end
    

      it "自己紹介が空欄" do
        @profile.text = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include("自己紹介を入力してください")
      end
    end
  end

end
