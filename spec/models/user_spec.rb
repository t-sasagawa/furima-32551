require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに一意性がなければ登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない" do
        @user.email = "levihotmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordは6文字以上でなければ登録できない" do
        @user.password = "000a0"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "パスワードは半角英数字混合でなければ登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "パスワードは、確認用のパスワードと値が一致しなければ登録できない" do
        @user.password = "111aaa"
        @user.password_confirmation = "aaa111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "ユーザーの本名は、名字がなければ登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "ユーザーの本名は、名前がなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "ユーザーの本名は名字が全角（ひらがな、カタカナ、漢字）でなければ登録できない" do
        @user.first_name = "ABC"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")        
      end
      it "ユーザーの本名は名前が全角（ひらがな、カタカナ、漢字）でなければ登録できない" do
        @user.last_name = "ABC"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")        
      end
      it "ユーザーの本名のフリガナは名字がなければ登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")        
      end
      it "ユーザーの本名のフリガナは名前がなければ登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")        
      end
      it "ユーザーの本名のフリガナは名字がカタカナでなければ登録できない" do
        @user.first_name_kana = "かたかな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")        
      end
      it "ユーザーの本名のフリガナは名前がカタカナでなければ登録できない" do
        @user.last_name_kana = "かたかな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana Full-width katakana characters")        
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end

    end
  end
end
