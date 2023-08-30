require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスク登録' do
    context 'タスク登録できる場合' do
      it 'content,itsu,userが存在すれば登録できる' do
        expect(@task).to be_valid
      end
      it 'freaquencyが空でも登録できる' do
        @task.frequency_id = ''
        expect(@task).to be_valid
      end
    end
    context '登録できない場合' do
      it 'contentが空では登録できない' do
        @task.content = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentに特殊文字を含めると登録できない' do
        @task.content = '<こんにちは？>'
        @task.valid?
        expect(@task.errors.full_messages).to include("Content cannot contain special characters")
      end
      it 'itsuが空では登録できない' do
        @task.itsu = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Itsu can't be blank")
      end
      it 'userが空では登録できない' do
        @task.user = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("User must exist")
      end
      it 'roomが空では登録できない' do
        @task.room = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Room must exist")
      end
    end
  end
end