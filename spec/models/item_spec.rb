require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品登録' do
      context '新規出品登録がうまくいくとき' do
        it ' title,describe,catrgory_id,status_id,shipping_cost_id ,shipping_area_id,shipping_days_id,priceが存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '新規出品登録がうまくいかないとき' do
        it 'titleが空だと登録できない' do
          @item.title = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it 'describeが空だと登録できない' do
          @item.describe = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Describe can't be blank")
        end

        it 'catrgory_idが１だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it 'status_idが１だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it 'shipping_cost_idが１だと登録できない' do
          @item.shipping_cost_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
        end

        it 'shipping_area_idが１だと登録できない' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
        end

        it 'shipping_days_iが１だと登録できない' do
          @item.shipping_days_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
        end

        it 'priceが空だと登録できない' do
          @item.price = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが299円以下だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it 'priceが10000000円以上だと登録できない' do
          @item.price = 100000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'priceが全角数字だと登録できない' do
         @item.price = "２０００"
         @item.valid?
         expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'imageが空だと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end
end
