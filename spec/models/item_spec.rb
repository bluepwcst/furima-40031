require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # 事前に適切なファクトリを定義しておく必要があります。
  end

  describe 'アイテムの保存' do
    context 'アイテムが保存できる場合' do
      it 'すべての属性が正しく設定されていれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context 'アイテムが保存できない場合' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '名前がないと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

            it '価格が空では保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end

      it '価格が半角数値でないと保存できない' do
        @item.price = '１０００' # 全角数値
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      # 以下、同様に他の属性についてもテストを記述
      it 'カテゴリーが1では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が1では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料の負担が1では保存できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it '発送元の地域が1では保存できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数が1では保存できない' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end

      # 価格に関するテスト
      it '価格が300円未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9,999,999円を超えると保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が整数でないと保存できない' do
        @item.price = '1000.5' # 非整数値を設定
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end      
    end
  end
end
