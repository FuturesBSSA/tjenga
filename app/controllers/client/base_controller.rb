module Client
  class BaseController < ApplicationController
    # layout "client"

    before_action :authenticate_client!
  end
end
