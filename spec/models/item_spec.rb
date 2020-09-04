require 'rails_helper'

describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it "image,name,description,category_id,status_id,price,shipping_charge_id,area_id,shipping_time_idを入力してれば出品できる" do
        expect(@item).to be_valid
      end

      it "priceが半角数字入力なら出品できる" do
        @item.price = "1000"
        expect(@item).to be_valid
      end

      it "priceが300以上なら出品できる" do
        @item.price = "333"
        expect(@item).to be_valid
      end

      it "priceが9999999以下なら出品できる" do
        @item.price = "1999999"
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it "imageが無いと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameがないと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionがないと出品できない" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idがないと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "status_idがないと出品できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it "priceがないと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが半角数字入力でないと出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが300以上でないと出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "priceがpriceが9999999以上だと出品できない" do
        @item.price = "19999999"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "shipping_charge_idがないと出品できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end

      it "area_idがないと出品できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end

      it "shipping_time_idがないと出品できない" do
        @item.shipping_time_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time is not a number")
      end

    end
  end
end




  