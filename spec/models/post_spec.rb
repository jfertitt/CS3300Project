require "rails_helper"

RSpec.describe Post, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      post = Post.new(title: "Content of the description")
      expect(post.valid?).to eq(false)
    end

    it "ensures the description is present" do
      post = Post.new(title: "Title")
      expect(post.valid?).to eq(false)
    end
    
    it "should be able to save project" do
      post = Post.new(title: "Title", content: "Some description content goes here")
      expect(post.save).to eq(true)
    end
  end

  context "scopes tests" do

  end
end