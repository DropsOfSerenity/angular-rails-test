require "rails_helper"

describe Api::V1::PostsController do
  describe "#index" do
    it "should return 200" do
      get :index, format: :json
      expect(response).to be_success
    end

    it "should show created posts" do
      post_obj = FactoryGirl.create(:post)
      get :index, format: :json
      expect(json_response["posts"].length).to eq 1
      created_post = json_response["posts"].first
      expect(created_post["title"]).to eq post_obj.title
      expect(created_post["text"]).to eq post_obj.text
    end

    it "should paginate by :page_size" do
      5.times { FactoryGirl.create(:post) }
      get :index, :page_size => 3, format: :json
      expect(json_response["posts"].length).to eq 3
      expect(json_response["_links"]["last_num"]).to eq 2
    end
  end

  def json_response
    JSON.parse(response.body)
  end
end
