require 'rails_helper'

RSpec.describe OrderDeliveryAddress, type: :model do
  
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_delivery_address = FactoryBot.build(:order_delivery_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery_address.building_name = ''
        expect(@order_delivery_address).to be_valid
      end 
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_delivery_address.post_code = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery_address.post_code = '1234567'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_delivery_address.prefecture_id = '1'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery_address.city = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_delivery_address.address = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存可能保存できないこと' do
        @order_delivery_address.phone_number = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number can't be blank")
      
      end
      it 'phone_numberが半角数値のみでないと保存可能保存できないこと' do
        @order_delivery_address.phone_number = '１２３４５６７８９０'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが10桁以上11桁以内でないと保存可能保存できないこと' do
        @order_delivery_address.phone_number = '123456789012'
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_delivery_address.user_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_delivery_address.item_id = nil
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_delivery_address.token = ''
        @order_delivery_address.valid?
        expect(@order_delivery_address.errors.full_messages).to include("Token can't be blank")
 
      end
    end
  end
end

