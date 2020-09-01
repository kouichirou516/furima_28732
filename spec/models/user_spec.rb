require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとfirst_name,last_nameとfirst_name_kana,last_name_kanaとemailとpasswordとpassword_confirmationとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）入力であれば登録できる" do
        @user.first_name = "全かク"
        expect(@user).to be_valid
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）入力であれば登録できる" do
        @user.last_name = "全かク"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角（カタカナ）入力であれば登録できる" do
        @user.first_name_kana = "カタカナ"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角（カタカナ）入力であれば登録できる" do
        @user.last_name_kana = "カタカナ"
        expect(@user).to be_valid
      end

      it "emailが@を含んでいたら登録できる" do
        @user.email = "kou516@gmail.com"
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "Aab123"
        @user.password_confirmation = "Aab123"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）以外の文字、数字を含むと登録できない" do
        @user.first_name = "name123$%&"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）以外の文字、数字を含むと登録できない" do
        @user.last_name = "name123$%&"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end
      
      it "first_name_kanaが全角（カタカナ）以外の文字、数字を含むと登録できない" do
        @user.first_name_kana = "kanaかな123＃＄％"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana  Full-width katakana characters")
      end

      it "last_name_kanaが全角（カタカナ）以外の文字、数字を含むと登録できない" do
        @user.last_name_kana = "kanaかな123＃＄％"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana  Full-width katakana characters")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが@を含んでいない場合登録できない" do
        @user.email = "kou516gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is must NOT contain any other characters than alphanumerics.")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数字以外が使われた場合登録できない" do
        @user.password = "Ａあア＃＄％＆１"
        @user.password_confirmation = "Ａあア＃＄％＆１"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end
  end
end
