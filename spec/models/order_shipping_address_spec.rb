require 'rails_helper'

describe OrderShippingAddress do 
  before do
    @user_id = FactoryBot.create(:user)
    @item_id = FactoryBot.build(:item)
    @item_id.image = fixture_file_upload('public/images/test_image.png')
    @item_id.save
    sleep 1
    # @item = FactoryBot.build(:item)
    # @order_shipping_address = FactoryBot.build(:order_shipping_address)
    @order_shipping_address = FactoryBot.build(:order_shipping_address,user_id: @user_id.id, item_id: @item_id.id)
  end

  describe '商品購入' do
    context '購入ができるとき' do
      it 'すべての値が正しく入力されていればOK' do
        expect(@order_shipping_address).to be_valid
      end

      it "postal_codeがハイフンありならOK" do
        @order_shipping_address.postal_code = "111-1111"
        expect(@order_shipping_address).to be_valid
      end

      it "phone_numberが11桁ならOK" do
        @order_shipping_address.phone_number = "09012345678"
        expect(@order_shipping_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_shipping_address.building = nil
        expect(@order_shipping_address).to be_valid
      end
    end

    context '購入ができないとき' do
      it 'tokenがない' do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
    
      it 'postal_codeがない' do
        @order_shipping_address.postal_code = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角数字でない' do
        @order_shipping_address.postal_code = "１１１ー１１１１"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeにハイフンがない' do
        @order_shipping_address.postal_code = "1111111"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid")
      end

      it 'prefectures_idが--はNG' do
        @order_shipping_address.prefectures_id = "1"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it 'cityが空だとNG' do
        @order_shipping_address.city = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だとNG' do
        @order_shipping_address.address = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だとNG' do
        @order_shipping_address.phone_number = ""
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが半角数字でない場合NG' do
        @order_shipping_address.phone_number = "０９０１２３４５６７８"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberにハイフンがついている場合NG' do
        @order_shipping_address.phone_number = "090-1234-5678"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが12文字以上の場合NG' do
        @order_shipping_address.phone_number = "090123456789"
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end







