require "rails_helper"

RSpec.describe Post, type: :model do
  # ...

  context "scopes tests" do
    let(:params) { { title: "Title", description: "some description" } }
    before(:each) do
      Post.create(params)
      Post.create(params)
      Post.create(params)
    end

    it "should return all projects" do
      expect(Post.count).to eq(3)
    end

  end
end