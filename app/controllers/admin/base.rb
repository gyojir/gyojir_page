class Admin::Base < ApplicationController
  before_action :basic_auth

  def basic_auth
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV["BASIC_AUTH_USER"] && pass == ENV["BASIC_AUTH_PASS"]
    end
  end
end
