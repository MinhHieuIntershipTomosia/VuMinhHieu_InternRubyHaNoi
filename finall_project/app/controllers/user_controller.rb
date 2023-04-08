class UserController < ApplicationController
  def new
    render template: 'user/new', layout: false

  end
end
