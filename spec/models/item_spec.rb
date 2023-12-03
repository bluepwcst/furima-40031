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

      # 以下、同様に他の属性についてもテストを記述
      # ...

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
