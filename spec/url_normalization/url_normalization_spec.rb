require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe UrlNormalization do
  before :all do
    User.normalize_url :url
  end

  describe "with a model which has a field normalized" do
    before do
      @user = User.new
    end
    
    it "should not add http:// if it was already included" do
      @user.url = "http://example.com"
      @user.url.should == "http://example.com"
    end

    it "should add http:// if it was not included" do
      @user.url = "example.com"
      @user.url.should == "http://example.com"
    end
 
    it "should not add http:// if https:// was already included" do
      @user.url = "https://example.com"
      @user.url.should == "https://example.com"
    end
  end
end