require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_katakana、last_name_katakana、birth_dateが存在すれば登録できる" do

      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do

      end
      it "emailが空では登録できない" do

      end
      it "passwordが空では登録できない" do

      end
      it 'passwordが5文字以下では登録できない' do

      end
      it 'passwordが129文字以上では登録できない' do

      end
      it 'passwordが英数を含まないと登録できない' do

      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end
      it '重複したemailが存在する場合は登録できない' do

      end
      it 'emailは@を含まないと登録できない' do

      end
      it 'first_nameはが空では登録できない' do

      end
      it 'first_nameはが漢字、ひらがな、カタカナ以外は登録できない' do

      end
      it 'last_nameはが空では登録できない' do

      end
      it 'last_nameはが漢字、ひらがな、カタカナ以外は登録できない' do

      end
      it 'first_name_katakanaが空では登録できない' do

      end
      it 'first_name_katakanaはカタカナ以外は登録できない' do

      end
      it 'last_name_katakanaが空では登録できない' do

      end
      it 'last_name_katakanaはカタカナ以外は登録できない' do

      end
      it 'birth_dateが空では登録できない' do

     
    end
  end
  
end
