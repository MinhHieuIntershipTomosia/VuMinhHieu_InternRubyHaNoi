// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails



import "@hotwired/turbo-rails"
import "controllers"

import "jquery"
import "jquery_ujs"
import "popper"
import "bootstrap"

import "chart.js"
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

