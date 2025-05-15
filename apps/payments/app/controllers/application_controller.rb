# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  include Devise::Controllers::Helpers

  # Auto‑sign in in dev
  if Rails.env.development?
    before_action :auto_sign_in_dev_user

    private
    def auto_sign_in_dev_user
      user = User.find_or_create_by!(email: "dev@example.com") do |u|
        u.password = "password"
      end
      sign_in(user)
    end
  end

  # After login bounce back to checkout
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || checkout_path
  end
end
