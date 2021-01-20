require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント機能' do

    context 'コメント機能がうまくいくとき' do
      it "text、item、userが存在すればコメントできる" do
        expect(@comment).to be_valid
      end
    end
    
    context 'コメント機能がうまくいかないとき' do
      it 'textがなければコメントできない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'itemがなければコメントできない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
      it 'userがなければコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end

  end
end
