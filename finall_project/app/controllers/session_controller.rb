class SessionController < ApplicationController
  def login
    render template: 'session/login', layout: false
  end
end
