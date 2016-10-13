require 'securerandom'

class SiteBController < ApplicationController
  skip_before_action :verify_authenticity_token

  def cookie_write
    name = params[:name] || "foo"
    v = SecureRandom.hex(4)
    cookies[name.to_sym] = v
    back_url = params[:back_url]
    raise "back_url required" if back_url.blank?
    redirect_to back_url
  end
end
