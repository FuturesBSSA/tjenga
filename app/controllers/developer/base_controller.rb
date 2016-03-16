module Developer
  class BaseController < ApplicationController

    before_action :authenticate_developer!
  end
end
