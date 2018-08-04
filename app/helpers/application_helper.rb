# frozen_string_literal: true

module ApplicationHelper
  # Returns class hierarchy in a string
  # e.g.: class_hierarchy( [params[:controller].split("/").each { |n| n }, action_name] )
  def class_hierarchy options = [], delimiter = ' '
      options.map(&:inspect).join(delimiter).gsub('"', '').gsub(',', '').gsub('[', '').gsub(']', '')
  end
end
