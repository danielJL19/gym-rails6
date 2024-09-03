class DashboardController > ApplicationController
  include AuthenticateHelper

  before_action :authenticate_user
end