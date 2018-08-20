class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  protected

  def fetch_categories
    @head_categories = Category.where("position IS NOT NULL").pluck(:name, :slug)
  end
end
