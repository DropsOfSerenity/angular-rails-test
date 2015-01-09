require 'rails_helper'

describe Post do
  it { should have_many(:comments) }
  it { should belong_to(:user) }

  describe ".recent" do
    it "returns a list sorted by date" do
      old = FactoryGirl.create(:post, :last_week)
      new = FactoryGirl.create(:post, :now)
      expect(Post.recent).to eq [new, old]
    end
  end
end
