class Admin::CategoriesController < ApplicationController
  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end
end
