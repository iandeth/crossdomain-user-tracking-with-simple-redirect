require 'uri'

class SiteAController < ApplicationController

  def index
    if params[:login_done] == "1"
      @host = resolve_host()
      q = {
        name: "logged_in",
        back_url: %Q|http://#{request.env["HTTP_HOST"]}/a/|
      }
      redirect_to "#{@host}/b/cookie-write/?#{q.to_query}"
    end
  end

  private
  def resolve_host
   if request.headers['SERVER_NAME'].match(/heroku/)
     "http://kzp.bashi-heroku.pbcd.net"
   elsif request.headers['SERVER_NAME'].match(/ngrok/)
     "http://c21c5230.ngrok.io"
   else
     "http://www.domain-b.dev:3000"
   end
  end
end
