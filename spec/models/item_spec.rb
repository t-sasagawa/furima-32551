require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品機能がうまくいくとき' do
        it "title、text、category_id、state_id、fee_id、prefecture_id、days_ship_id、priceが存在すれば出品できる" do
          expect(@item).to be_valid
        end
      end
    
      context '商品出品機能がうまくいかないとき' do
        it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it "titleが空だと登録できない" do
          @item.title = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it "textが空だと登録できない" do
          @item.text = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end
        it "category_idが0だと登録できない" do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category Select")
        end
        it "state_idが0だと登録できない" do
          @item.state_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("State Select")
        end
        it "fee_idが0だと登録できない" do
          @item.fee_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee Select")
        end
        it "prefecture_idが0だと登録できない" do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture Select")
        end
        it "days_ship_idが0だと登録できない" do
          @item.days_ship_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Days ship Select")
        end
        it "priceが空だと登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it "priceの範囲が¥300~¥9,999,999の間でなければ登録できない" do
          @item.price = 290
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
        it "priceが半角英字だと登録できない" do 
          @item.price = "abc"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end
        it "priceが全角だと登録できない" do 
          @item.price = "０あア"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end
        it "priceが半角英数字だと登録できない" do 
          @item.price = 345, "abc"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Half-width number")
        end
      end

    end
  end
end
