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

    it "should not assign the http if empty" do
      @user.url = ""
      @user.url.should == ""
    end

    it "should not assign the http if nil" do
      @user.url = nil
      @user.url.should be_nil
    end

    it "should strip whitespace for a url which includes http://" do
      @user.url = "http://foobar.com    "
      @user.url.should == "http://foobar.com"
    end

    it "should strip a url which does not include http" do
      @user.url = "     foobar.com    "
      @user.url.should == "http://foobar.com"
    end

    it "should downcase a string" do
      @user.url = "GITHUB.com"
      @user.url.should == "http://github.com"
    end
  end
end
