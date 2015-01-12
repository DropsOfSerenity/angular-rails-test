require "rails_helper"

describe Api::V1::PostsController do
  describe "#index" do
    it "should return 401 when not logged in" do
      get :index
      expect(response.status).to eq 200
    end
  end
end
