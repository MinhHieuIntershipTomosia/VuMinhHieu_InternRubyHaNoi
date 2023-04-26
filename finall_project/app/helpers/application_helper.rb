# frozen_string_literal: true

# Module for providing helper methods for the application views
module ApplicationHelper
  def full_title(title = '')
    base_title = 'Website thanksCard page '
    if title.empty?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
