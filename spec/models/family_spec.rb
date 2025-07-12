require 'rails_helper'

RSpec.describe Family, type: :model do
  before do
    @family = FactoryBot.build(:family)
  end

  describe '患者家族新規登録' do
      # 患者家族登録正常系
    context '登録できる場合' do
      it 'すべての情報が正しく入力されていれば登録できる' do
      end
    end
      # 患者家族登録異常系
    context '登録できない場合' do
        # 姓
      it '姓が空では登録できない' do
      end
        # 名
      it '名が空では登録できない' do
      end
        # セイ
      it 'セイが空では登録できない' do
      end
      it 'セイが平仮名では登録できない' do
      end
      it 'セイが半角カタカナでは登録できない' do
      end
      it 'セイが漢字では登録できない' do
      end
      it 'セイがアルファベットでは登録できない' do
      end
      # メイ
      it 'メイが空では登録できない' do
      end
      it 'メイが平仮名では登録できない' do
      end
      it 'メイが半角カタカナでは登録できない' do
      end
      it 'メイが漢字では登録できない' do
      end
      it 'メイがアルファベットでは登録できない' do
      end
        # メール
      it 'メールが空では登録できない' do
      end
      it '重複したメールアドレスが存在する場合登録できない' do
      end
        # パスワード
      it 'パスワードが空では登録できない' do
      end
      it 'パスワードが6文字未満では登録できない' do
      end
      it 'パスワードとパスワード確認が一致しないと登録できない' do
      end
    end
  end
end
