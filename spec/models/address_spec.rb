require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所情報の保存' do
    context '住所情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @address.building_name = ''
        expect(@address).to be_valid
      end
    end

    context '住所情報が保存できない場合' do
      it '郵便番号が空では保存できないこと' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号がハイフン無しでは保存できないこと' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が空では保存できないこと' do
        @address.region_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Region can't be blank")
      end

      it '市区町村が空では保存できないこと' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では保存できないこと' do
        @address.street_address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満では保存できないこと' do
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it '電話番号が11桁を超えると保存できないこと' do
        @address.phone_number = '123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it '電話番号にハイフンが含まれると保存できないこと' do
        @address.phone_number = '090-1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is not a number")
      end
    end
  end
end
