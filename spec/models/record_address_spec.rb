require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @record_address = FactoryBot.build(:record_address)
    end

    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      it 'postal_codeが空だと保存できないこと' do
        @record_address.postal_code = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと保存できないこと' do
        @record_address.prefecture_id = 0
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityは空だと保存できないこと' do
        @record_address.city = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberは空だと保存できないこと' do
        @record_address.house_number = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'building_nameは空でも保存できること' do
        @record_address.building_name = nil
        expect(@record_address).to be_valid
      end

      it 'phone_number空だと保存できないこと' do
        @record_address.phone_number = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが1２桁以上だと保存できない' do
        @record_address.phone_number = '090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'phone_numberにハイフンを含むと保存できない' do
        @record_address.phone_number = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number input only number')
      end

      it 'tokenが空では登録できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
