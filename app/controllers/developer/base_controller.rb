class Developer::BaseController < ApplicationController

  before_action :authenticate_developer!
end

