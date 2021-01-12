require 'rails_helper'

RSpec.describe ShippingOrder, type: :model do
  describe '#create' do
    before do
      # user = FactoryBot.build(:user)
      order_user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @order = FactoryBot.build(:shipping_order, item_id: item.id, user_id: order_user.id)
    end

    describe '商品購入機能' do
      context '商品購入機能がうまくいくとき' do
        it "postalcode、prefecture_id、municpality、address、building、phone_numberが存在すれば購入できる" do
          expect(@order).to be_valid
        end
      end
      
      context '商品購入機能がうまくいかないとき' do
      it 'postal_codeがなければ購入できない' do
        @order.postal_code = ""
        @order.valid?
        binding.pry
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフンがなければ購入できない' do
        @order.postal_code = "2222222"
        # binding.pry
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが0だと登録できない" do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end

      it "municpalityがなければ購入できない" do
        @order.municipality = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "addressがなければ購入できない" do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberがなければ購入できない" do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it "phone_numberが11文字以下でなければ購入できない" do
        @order.phone_number = "123456789012"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number Must be 11 characters or less")
      end

    end
    end
  end
end