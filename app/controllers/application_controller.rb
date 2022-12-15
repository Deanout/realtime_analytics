class ApplicationController < ActionController::Base
  after_action :track_action

  protected

  def track_action
    ahoy.track 'Ran action',
               request.path_parameters
  end
end
