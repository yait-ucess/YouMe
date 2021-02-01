require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe "記事投稿" do
    context "成功する場合" do
      it "記入欄全てに正しい値が存在する" do
        expect(@article).to be_valid
      end
    end
  
  
    context "失敗する場合" do
      it "画像が添付されていない" do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("画像を入力してください")
      end


      it "画像が添付されていない" do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("画像を入力してください")
      end


      it "タイトルが空欄" do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("タイトルを入力してください")
      end


      it "記事内容が空欄" do
        @article.text = nil
        @article.valid?
        expect(@article.errors.full_messages).to include("記事を入力してください")
      end
    end
  end

end
