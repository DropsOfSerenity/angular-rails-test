require "rails_helper"

describe Api::V1::PostsController do
  describe "#index" do
    it "should return 200" do
      get :index
      expect(response.status).to eq 200
    end

    it "should paginate" do

    end
  end
end
