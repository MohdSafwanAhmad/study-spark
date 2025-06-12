class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def after_sign_up_path_for(resource)
    if resource.tutor?
      learners_path
    else
      dashboard_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.tutor?
      learners_path
    else
      dashboard_path
    end
  end
end

def default_url_options
{ host: ENV['DOMAIN'] || 'localhost:3000' }
end