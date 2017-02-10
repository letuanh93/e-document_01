require "rails_helper"
require "cancan/matchers"

describe Ability, type: :model do
  describe "as an admin user" do
    before(:each) do
      @user ||= FactoryGirl.create(:user, role: 1)
      @ability = Ability.new(@user)
    end

    it "should be able to manage all" do
      expect(@ability).to be_able_to(:manage, :all)
    end
  end

  describe "as a usual user" do
    let!(:category){FactoryGirl.create :category}
    let!(:document){FactoryGirl.create :document}
    let!(:favorite){FactoryGirl.create :favorite}
    let!(:comment){FactoryGirl.create :comment}
    let!(:coin){FactoryGirl.create :coin}
    before(:each) do
      @user ||= FactoryGirl.create(:user)
      @ability = Ability.new(@user)
    end

    context "User's permission to read test case: " do
      it {expect(@ability).to be_able_to(:read, category)}
      it {expect(@ability).to be_able_to(:read, document)}
      it {expect(@ability).to be_able_to(:read, favorite)}
      it {expect(@ability).to be_able_to(:read, comment)}
      it {expect(@ability).to be_able_to(:read, coin)}
    end

    context "User's permission to create (Success case): " do
      it {expect(@ability).to be_able_to(:create, Comment.new(user_id: @user.id))}
      it {expect(@ability).to be_able_to(:create, Favorite.new(user_id: @user.id))}
      it {expect(@ability).to be_able_to(:create, Coin.new)}
    end

    context "User's permission to create (Failure case): " do
      it {expect(@ability).not_to be_able_to(:create, Chatroom.new)}
      it {expect(@ability).not_to be_able_to(:create, Buycoin.new)}
    end

    context "User's permission to destroy (Success case): " do
      it {expect(@ability).to be_able_to(:destroy, Document.new(user_id: @user.id))}
      it {expect(@ability).to be_able_to(:destroy, Favorite.new(user_id: @user.id))}
    end

    context "User's permission to destroy (Failure case): " do
      it {expect(@ability).not_to be_able_to(:destroy, Comment.new(user_id: @user.id))}
      it {expect(@ability).not_to be_able_to(:destroy, Coin.new)}
    end

    context "User's permission to manage (Success case): " do
      it {expect(@ability).to be_able_to(:manage, Relationship.new)}
    end

    context "User's permission to manage (Failure case): " do
      it {expect(@ability).not_to be_able_to(:manage, Chatroom.new)}
      it {expect(@ability).not_to be_able_to(:manage, Buycoin.new)}
      it {expect(@ability).not_to be_able_to(:manage, Comment.new(user_id: @user.id))}
      it {expect(@ability).not_to be_able_to(:manage, Coin.new)}
      it {expect(@ability).not_to be_able_to(:manage, Favorite.new(user_id: @user.id))}
      it {expect(@ability).not_to be_able_to(:manage, Document.new(user_id: @user.id))}
    end
  end
end
