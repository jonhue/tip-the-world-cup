# frozen_string_literal: true

module LayoutsHelper
  def body_class(custom_class)
    'myg myg-layout myg-layout--toolbar '\
    "#{class_hierarchy([params[:controller].split('/'), action_name])} "\
    "#{custom_class}"
  end
end
