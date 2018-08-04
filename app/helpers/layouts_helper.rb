# frozen_string_literal: true

module LayoutsHelper
  def body_class
    'myg myg-layout '\
    "#{class_hierarchy([params[:controller].split('/'), action_name])} "\
    "#{area(:body_class)}"
  end
end
