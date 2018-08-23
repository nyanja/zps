# frozen_string_literal: true

module ApplicationHelper
  def render_md content
    Redcarpet::Markdown
      .new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)
      .render(content.to_s.gsub(/\!ad\[(\d+)\]/) do |_|
        render partial: "meows/embedded", locals: { meow: @meows[$1.to_i] }
      end).html_safe
  end

  def title new_title
    @title = new_title
  end
end
