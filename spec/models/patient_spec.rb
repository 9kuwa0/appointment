require 'rails_helper'

RSpec.describe Patient, type: :model do
  before do
    @patient = FactoryBot.build(:patient)
  end

  describe '患者新規登録' do
      # 患者登録正常系
    context '患者の新規登録できる場合' do
      it '全ての情報が正しく入力されていれば登録できる' do
        expect(@patient).to be_valid
      end
    end

      # 患者登録異常系
    context '患者の新規登録できない場合' do
        # ID
      it '患者IDが空では登録できない' do
        @patient.patient_number = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include('患者IDを入力してください')
      end

      it '患者IDが5桁以下では登録できない' do
        @patient.patient_number = rand(0..99999)
        @patient.valid?
        expect(@patient.errors.full_messages).to include('患者IDは6桁の数字で入力してください')
      end

      it '患者IDが7桁以上では登録できない' do
        @patient.patient_number = rand(1000000..9999999999)
        @patient.valid?
        expect(@patient.errors.full_messages).to include('患者IDは6桁の数字で入力してください')
      end

      it '患者IDが重複すると登録できない' do
        @patient.save
        another_patient = FactoryBot.build(:patient, patient_number: @patient.patient_number)
        another_patient.valid?
        expect(another_patient.errors.full_messages).to include('患者IDはすでに存在します')
      end

        # 姓名
      it '姓が空では登録できない' do
        @patient.patient_last_name = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include('姓を入力してください')
      end

      it '名が空では登録できない' do
        @patient.patient_first_name = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include('名を入力してください')
      end

        # セイ
      it 'セイが空では登録できない' do
        @patient.patient_last_name_kana = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include('セイを入力してください')
      end

      it 'セイが平仮名では登録できない' do
        @patient.patient_last_name_kana = 'てっく'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('セイは不正な値です')
      end

      it 'セイが半角カタカナでは登録できない' do
        @patient.patient_last_name_kana = 'ﾃｯｸ'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('セイは不正な値です')
      end

      it 'セイが漢字では登録できない' do
        @patient.patient_last_name_kana = '技術'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('セイは不正な値です')
      end

      it 'セイがアルファベットでは登録できない' do
        @patient.patient_last_name_kana = 'Tech'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('セイは不正な値です')
      end

        # メイ
      it 'メイが空では登録できない' do
        @patient.patient_first_name_kana = ''
        @patient.valid?
        expect(@patient.errors.full_messages).to include('メイを入力してください')
      end

      it 'メイが平仮名では登録できない' do
        @patient.patient_first_name_kana = 'てくてく'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('メイは不正な値です')
      end

      it 'メイが半角カタカナでは登録できない' do
        @patient.patient_first_name_kana = 'ﾃｸﾃｸ'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('メイは不正な値です')
      end

      it 'メイが漢字では登録できない' do
        @patient.patient_first_name_kana = '歩子'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('メイは不正な値です')
      end

      it 'メイがアルファベットでは登録できない' do
        @patient.patient_first_name_kana = 'Taku'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('メイは不正な値です')
      end

        # 生年月日
      it '生年月日が空では登録できない' do
        @patient.birthday = nil
        @patient.valid?
        expect(@patient.errors.full_messages).to include('生年月日を入力してください')
      end

        # 病棟
      it '病棟が3未満では登録できない' do
        @patient.floor = rand(0..2)
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟が6以上では登録できない' do
        @patient.floor = rand(6..999)
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟が平仮名では登録できない' do
        @patient.floor = 'さん'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟が全角カタカナでは登録できない' do
        @patient.floor = 'サン'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟が半角カタカナでは登録できない' do
        @patient.floor = 'ｻﾝ'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟が全角数字では登録できない' do
        @patient.floor = '３'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟が漢字では登録できない' do
        @patient.floor = '三'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

      it '病棟がアルファベットでは登録できない' do
        @patient.floor = 'three'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('階は3〜5を入力してください')
      end

        # 病室
      it '病室が300未満では登録できない' do
        @patient.room = rand(0..299)
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は300以上の値にしてください')
      end

      it '病室が600以上では登録できない' do
        @patient.room = rand(600..9999999)
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は599以下の値にしてください')
      end

      it '病室が平仮名では登録できない' do
        @patient.room = 'さんびゃく'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は数値で入力してください')
      end

      it '病室が全角カタカナでは登録できない' do
        @patient.room = 'サンビャク'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は数値で入力してください')
      end

      it '病室が半角カタカナでは登録できない' do
        @patient.room = 'ｻﾝﾋﾞｬｸ'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は数値で入力してください')
      end

      it '病室が全角数字では登録できない' do
        @patient.room = '３００'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は数値で入力してください')
      end

      it '病室が漢字では登録できない' do
        @patient.room = '三百'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は数値で入力してください')
      end

      it '病室がアルファベットでは登録できない' do
        @patient.room = 'ABC'
        @patient.valid?
        expect(@patient.errors.full_messages).to include('病室は数値で入力してください')
      end
    end
  end
end
