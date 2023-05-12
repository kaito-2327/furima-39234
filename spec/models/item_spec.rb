require 'rails_helper'

RSpec.describe User, type: :item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '新規投稿' do
    context '新規投稿できる場合' do
      it '必要事項を全て過不足なく入力すると登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規投稿できない場合' do
      it "titleがない場合は登録できないこと" do # テストしたいことの内容
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "priceがない場合は登録できないこと" do # テストしたいことの内容
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "全角文字でpriceは登録できない" do # テストしたいことの内容
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "priceが0〜299は登録できない" do # テストしたいことの内容
        @item.price = '123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end
      
      it "priceが9999999以上は登録できない" do # テストしたいことの内容
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "explanがない場合は登録できないこと" do # テストしたいことの内容
        @item.explan = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explan can't be blank")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "category_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "situation_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation must be other than 1")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "charge_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "prefecture_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "take_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.take_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Take must be other than 1")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

