require "rails_helper"

RSpec.describe User, type: :model do
  describe "バリデーション" do
    subject { user.valid? }

    context "データが条件を満たすとき" do
      let(:user) { build(:user) }
      it "保存できる" do
        expect(subject).to eq true
      end
    end

    context "email が空のとき" do
      let(:user) { build(:user, email: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "を入力してください", "は不正な値です"
      end
    end

    context "email がすでに存在するとき" do
      before { create(:user, email: "test@example.com") }
      let(:user) { build(:user, email: "test@example.com") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "はすでに存在します"
      end
    end

    context "email が アルファベット･英数字 のみのとき" do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include "は不正な値です"
      end
    end

    context "password が空のとき" do
      let(:user) { build(:user, password: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end

    context "password が6文字以下のとき" do
      let(:user) { build(:user, password: "a" * 5) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password]).to include "は6文字以上で入力してください"
      end
    end

    context "password_confirmation が空のとき" do
      let(:user) { build(:user, password_confirmation: "") }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password_confirmation]).to include "を入力してください"
      end
    end

    context "password_confirmation が6文字以下のとき" do
      let(:user) { build(:user, password_confirmation: "a" * 5) }
      it "エラーが発生する" do
        expect(subject).to eq false
        expect(user.errors.messages[:password_confirmation]).to include "は6文字以上で入力してください"
      end
    end
  end
end
