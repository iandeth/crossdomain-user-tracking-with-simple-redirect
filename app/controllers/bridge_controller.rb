class BridgeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    m = (request.headers['HTTP_COOKIE'] || "").match(/logged_in=(\d+)/) || []
    v = m[1] || 0
    render :js => %Q|var kz = { logged_in: #{v} };|
  end
end
