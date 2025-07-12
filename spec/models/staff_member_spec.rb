require 'rails_helper'

RSpec.describe StaffMember, type: :model do
  before do
    @staff_member = FactoryBot.build(:staff_member)
  end

  describe 'スタッフ新規登録' do
      # スタッフ登録正常系
    context '新規登録できる場合' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@staff_member).to be_valid
      end
    end
      # スタッフ登録異常系
    context '新規登録できない場合' do
      it '職員IDが空では登録できない' do
        @staff_member.staff_number = ""
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('IDを入力してください')
      end

      it '職員IDが3桁以下では登録できない' do
        @staff_member.staff_number = rand(0..999)
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('IDは4桁の数字で入力してください')
      end

      it '職員IDが5桁以上では登録できない' do
        @staff_member.staff_number = rand(10000..999999999)
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('IDは4桁の数字で入力してください')
      end

      it '姓が空では登録できない' do
        @staff_member.staff_last_name = ""
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('姓を入力してください')
      end

      it '名が空では登録できない' do
        @staff_member.staff_first_name = ""
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('名を入力してください')
      end

      it '部署が1の未選択では登録できない' do
        @staff_member.staff_department_id = 1
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('部署は未選択以外で入力してください')
      end

      it '所属が1の未選択では登録できない' do
        @staff_member.staff_affiliation_id = 1
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('所属は未選択以外で入力してください')
      end

      it 'メールアドレスが空では登録できない' do
        @staff_member.email = ''
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it '重複したメールアドレスが存在する場合登録できない' do
        @staff_member.save
        another = FactoryBot.build(:staff_member, email: @staff_member.email)
        another.valid?
        expect(another.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

      it 'パスワードが空では登録できない' do
        @staff_member.password = ''
        @staff_member.password_confirmation = ''
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'パスワードが6文字未満では登録できない' do
        @staff_member.password = '12345'
        @staff_member.password_confirmation = '12345'
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'パスワードとパスワード確認が一致しないと登録できない' do
        @staff_member.password = 'password1'
        @staff_member.password_confirmation = 'password2'
        @staff_member.valid?
        expect(@staff_member.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
      end
    end
  end
end
