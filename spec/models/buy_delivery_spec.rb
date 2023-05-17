require 'rails_helper'

RSpec.describe BuyDelivery, type: :model do
  describe '商品購入記録の保存' do
    before do
       @user = FactoryBot.create(:user)
       @item = FactoryBot.create(:item)
       @buy_delivery = FactoryBot.build(:buy_delivery, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buy_delivery).to be_valid
      end
      it '建物名が空でも購入できること' do
        @buy_delivery.bldg = ''
        expect(@buy_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号は空では保存できないこと' do
        @buy_delivery.post_code = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
        @buy_delivery.post_code = '123-123４'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されている場合は購入できないこと' do
        @buy_delivery.prefecture_id = '1'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空だと購入できないこと' do
        @buy_delivery.municipality = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入できないこと' do
        @buy_delivery.address = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できないこと' do
        @buy_delivery.phone = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が9桁以下だと購入できないこと' do
        @buy_delivery.phone = '090123456'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @buy_delivery.phone = '090123456789'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号が半角数値でないと購入できないこと' do
        @buy_delivery.phone = '０9012341234'
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空では購入できないこと' do
        @buy_delivery.token = nil
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが紐づいていなければ購入できないこと' do
        @buy_delivery.user_id = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ購入できないこと' do
        @buy_delivery.item_id = ''
        @buy_delivery.valid?
        expect(@buy_delivery.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end