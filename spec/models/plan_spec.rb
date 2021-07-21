require "rails_helper"

RSpec.describe Plan, type: :model do
  describe "バリデーションのチェック" do
    context "title が空の時" do
      let(:plan) { build(:plan, title: "") }
      it "エラーが発生する" do
        expect(plan.valid?).to eq false
        expect(plan.errors.messages[:title]).to include "を入力してください", "は1文字以上で入力してください"
      end
    end

    context "title が51文字以上の時" do
      let(:plan) { build(:plan, title: "a" * 51) }
      it "エラーが発生する" do
        expect(plan.valid?).to eq false
        expect(plan.errors.messages[:title]).to include "は50文字以内で入力してください"
      end
    end

    context "day が空の時" do
      let(:plan) { build(:plan, day: "") }
      it "エラーが発生する" do
        expect(plan.valid?).to eq false
        expect(plan.errors.messages[:day]).to include "を入力してください"
      end
    end
  end
end
