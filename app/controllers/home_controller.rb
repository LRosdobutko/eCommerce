class HomeController < ApplicationController
  def landing
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # Redirect to the Sign In page
  end
end
