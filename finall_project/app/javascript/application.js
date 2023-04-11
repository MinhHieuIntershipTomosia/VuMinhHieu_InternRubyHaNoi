// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require select-option-thanksCard
import "@hotwired/turbo-rails"
import "controllers"

import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false