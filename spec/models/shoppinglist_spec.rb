require 'rails_helper'

RSpec.describe Shoppinglist, type: :model do
  before do
    @shoppinglist = FactoryBot.build(:shoppinglist)
  end

  describe 'ショッピングリスト登録' do
    context 'ショッピングリスト登録できる場合' do
      it 'content,room,userが存在すれば登録できる' do
        expect(@shoppinglist).to be_valid
      end
    end
    context '登録できない場合' do
      it 'textが空では登録できない' do
        @shoppinglist.content = ''
        @shoppinglist.valid?
        expect(@shoppinglist.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentに特殊文字を含めると登録できない' do
        @shoppinglist.content = '<こんにちは？>'
        @shoppinglist.valid?
        expect(@shoppinglist.errors.full_messages).to include("Content cannot contain special characters")
      end
      it 'userが空では登録できない' do
        @shoppinglist.user = nil
        @shoppinglist.valid?
        expect(@shoppinglist.errors.full_messages).to include("User must exist")
      end
      it 'roomが空では登録できない' do
        @shoppinglist.room = nil
        @shoppinglist.valid?
        expect(@shoppinglist.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
