class Admin::BaseController < ApplicationController
  USERNAME, PASSWORD = ENV['USERNAME'] , ENV['PASSWORD']
end
