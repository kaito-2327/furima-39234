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
        expect(@item.errors.full_messages).to include("タイトルを入力してください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "priceがない場合は登録できないこと" do # テストしたいことの内容
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("値段を入力してください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "全角文字でpriceは登録できない" do # テストしたいことの内容
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は数値で入力してください')# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "priceが0〜299は登録できない" do # テストしたいことの内容
        @item.price = '123'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は300以上の値にしてください')# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end
      
      it "priceが9999999以上は登録できない" do # テストしたいことの内容
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('値段は9999999以下の値にしてください')# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "explanがない場合は登録できないこと" do # テストしたいことの内容
        @item.explan = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("説明を入力してください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "category_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "situation_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "charge_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料は1以外の値にしてください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "prefecture_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元は1以外の値にしてください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it "take_idがない場合は登録できないこと" do # テストしたいことの内容
        @item.take_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")# errorsメソッドを使用して、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認し、.to include("を入力してください")でエラー文を記述(今回のRailsを日本語化しているのでエラー文も日本語)
      end

      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end

