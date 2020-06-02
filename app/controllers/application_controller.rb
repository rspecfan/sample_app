class ApplicationController < ActionController::Base
  def hello
    render html: "ok"
  end 
end
