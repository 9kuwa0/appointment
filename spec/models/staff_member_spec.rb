require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  before do
    @staff_member = FactoryBot.build(:staff_member)
  end

  describe 'スタッフ新規登録' do
      # スタッフ登録正常系
    context '新規登録できる場合' do
      it 'すべての情報が正しく入力されていれば登録できる' do
      end
    end
      # スタッフ登録異常系
    context '新規登録できない場合' do
      it '職員IDが空では登録できない' do
      end
      it '職員IDが3桁以下では登録できない' do
      end
      it '職員IDが5桁以上では登録できない' do
      end
      it '姓が空では登録できない' do
      end
      it '名が空では登録できない' do
      end
      it '部署が空では登録できない' do
      end
      it '所属が空では登録できない' do
      end
      it 'メールアドレスが空では登録できない' do
      end
      it '重複したメールアドレスが存在する場合登録できない' do
      end
      it 'パスワードが空では登録できない' do
      end
      it 'パスワードが6文字未満では登録できない' do
      end
      it 'パスワードとパスワード確認が一致しないと登録できない' do
      end
    end
  end
end
