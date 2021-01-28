require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  

  describe "ユーザー新規登録" do
    context "成功する場合" do
      it "記入欄全てに正しい値が存在する" do
        expect(@user).to be_valid
      end
    end
  

    context "失敗する場合" do
      it "ニックネームが空欄" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end

      it "メールアドレスが空欄" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it "メールアドレスに＠が含まれていない" do
        @user.email = "santagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end

      it "同じメールアドレスがすでに存在する" do
        first_user = FactoryBot.create(:user, email: "santa@gmail.com")
        second_user = FactoryBot.build(:user, email: "santa@gmail.com")
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it "パスワードが空欄" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it "パスワードが5文字以下" do
        @user.password = "a1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it "パスワードは全角では登録できない" do
        @user.password = "A１１１１１"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "パスワードは半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it "パスワードは半角数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

    end
  end
end
