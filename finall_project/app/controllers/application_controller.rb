class ApplicationController < ActionController::Base
  def hello
    render html: "this is my project!"
  end
end
