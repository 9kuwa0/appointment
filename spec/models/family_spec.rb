require 'rails_helper'

RSpec.describe Family, type: :model do
  before do
    @family = FactoryBot.build(:family)
  end

  describe '患者家族新規登録' do
      # 患者家族登録正常系
    context '登録できる場合' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@family).to be_valid
      end
    end
      # 患者家族登録異常系
    context '登録できない場合' do
        # 姓
      it '姓が空では登録できない' do
        @family.family_last_name = ""
        @family.valid?
        expect(@family.errors.full_messages).to include("姓を入力してください")
      end
        # 名
      it '名が空では登録できない' do
        @family.family_first_name = ""
        @family.valid?
        expect(@family.errors.full_messages).to include("名を入力してください")
      end
        # セイ
      it 'セイが空では登録できない' do
        @family.family_last_name_kana = ""
        @family.valid?
        expect(@family.errors.full_messages).to include("セイを入力してください", "セイは不正な値です")
      end
      it 'セイが平仮名では登録できない' do
        @family.family_last_name_kana = "てっく"
        @family.valid?
        expect(@family.errors.full_messages).to include("セイは不正な値です")
      end
      it 'セイが半角カタカナでは登録できない' do
        @family.family_last_name_kana = "ﾃｯｸ"
        @family.valid?
        expect(@family.errors.full_messages).to include("セイは不正な値です")
      end
      it 'セイが漢字では登録できない' do
        @family.family_last_name_kana = "技"
        @family.valid?
        expect(@family.errors.full_messages).to include("セイは不正な値です")
      end
      it 'セイがアルファベットでは登録できない' do
        @family.family_last_name_kana = "Tech"
        @family.valid?
        expect(@family.errors.full_messages).to include("セイは不正な値です")
      end
      # メイ
      it 'メイが空では登録できない' do
        @family.family_first_name_kana = ""
        @family.valid?
        expect(@family.errors.full_messages).to include("メイを入力してください", "メイは不正な値です")
      end
      it 'メイが平仮名では登録できない' do
        @family.family_first_name_kana = "てくてく"
        @family.valid?
        expect(@family.errors.full_messages).to include("メイは不正な値です")
      end
      it 'メイが半角カタカナでは登録できない' do
        @family.family_first_name_kana = "ﾃｸﾃｸ"
        @family.valid?
        expect(@family.errors.full_messages).to include("メイは不正な値です")
      end
      it 'メイが漢字では登録できない' do
        @family.family_first_name_kana = "術"
        @family.valid?
        expect(@family.errors.full_messages).to include("メイは不正な値です")
      end
      it 'メイがアルファベットでは登録できない' do
        @family.family_first_name_kana = "Tech"
        @family.valid?
        expect(@family.errors.full_messages).to include("メイは不正な値です")
      end
        # メール
      it 'メールが空では登録できない' do
        @family.email = ""
        @family.valid?
        expect(@family.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @family.save
        another = FactoryBot.build(:family, email: @family.email)
        another.valid?
        expect(another.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
        # パスワード
      it 'パスワードが空では登録できない' do
        @family.password = ''
        @family.password_confirmation = ''
        @family.valid?
        expect(@family.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'パスワードが6文字未満では登録できない' do
        @family.password = '12345'
        @family.password_confirmation = '12345'
        @family.valid?
        expect(@family.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'パスワードとパスワード確認が一致しないと登録できない' do
        @family.password = 'password1'
        @family.password_confirmation = 'password2'
        @family.valid?
        expect(@family.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end
  end
end
