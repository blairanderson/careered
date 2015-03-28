class ApiController < ApplicationController
  skip_before_action :protect_from_forgery
  before_filter :require_login
end
