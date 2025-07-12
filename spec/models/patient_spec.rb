require 'rails_helper'

RSpec.describe Patient, type: :model do
  before do
    @patient = FactoryBot.build(:patient)
  end

  describe '患者新規登録' do
      # 患者登録正常系
    context '患者の新規登録できる場合' do
      it '全ての情報が正しく入力されていれば登録できる' do
      end
    end
      # 患者登録異常系
    context '患者の新規登録できない場合' do
        # ID
      it '患者IDが空では登録できない' do
      end
      it '患者IDが5桁以下では登録できない' do
      end
      it '患者IDが7桁以上では登録できない' do
      end
      it '患者IDが重複すると登録できない' do
      end
        # 姓名
      it '姓が空では登録できない' do
      end
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
      it 'メイが全角カタカナでないと登録できない' do
      end
      it 'メイが半角カタカナでは登録できない' do
      end
      it 'メイが漢字では登録できない' do
      end
      it 'メイがアルファベットでは登録できない' do
      end
        # 生年月日
      it '生年月日が空では登録できない' do
      end
        # 病棟
      it '病棟が3〜5以外では登録できない' do
      end
      it '病棟が数字でないと登録できない' do
      end
        # 病室
      it '病室が300未満では登録できない' do
      end
      it '病室が600以上では登録できない' do
      end
      it '病室が数字でないと登録できない' do
        @patient.room = 'ABC'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は不正な値です')
      end
    end
  end
end
