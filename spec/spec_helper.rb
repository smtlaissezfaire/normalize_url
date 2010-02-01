require "rubygems"
require "active_record"
require File.expand_path(File.dirname(__FILE__) + "/../lib/url_normalization")
require File.expand_path(File.dirname(__FILE__) + "/../init")

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database  => ':memory:'
ActiveRecord::Migration.verbose = false
require 'sqlite3'

ActiveRecord::Schema.define do
  create_table :users, :force => true do |t|
    t.string :url
  end
end

class User < ActiveRecord::Base; end
