class ApplicationController < ActionController::API
  def home
    render plain: "Welcome to the content parser API"
  end
end
