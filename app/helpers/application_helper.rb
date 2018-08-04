# frozen_string_literal: true

module ApplicationHelper
  def class_hierarchy(options = [], delimiter = ' ')
    options.map(&:inspect).join(delimiter).delete('",[]')
  end
end
