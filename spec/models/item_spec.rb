require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿機能' do
    context '商品投稿できる場合' do
      it 'image、name,detail,price,ategory_id,condition_id,delivery_idprefectuer_id,delivery_day_id,priceが存在していれば保存できる' do
        expect(@item).to be_valid
       
      end
      
    end
    context '商品投稿できない場合' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")


      end
      it 'nemeが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")

      end
      it 'detailが空では保存できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")

      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")

      end
      it 'priceが全角では保存できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")

      end
      it 'priceが¥300未満では保存できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")

      end
      it 'priceが¥9999999より大きいと保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")

      end
      it 'category_idが1では保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")

      end
      it 'condition_idが1では保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")

      end
      it 'delivery_idが1では保存できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")

      end
      it 'prefecture_idが1では保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")

      end
      it 'delivery_day_idが1では保存できない' do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")


      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")

      end
    end
  end
end