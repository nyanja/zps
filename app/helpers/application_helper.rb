module ApplicationHelper
  def render_md(content)
    Redcarpet::Markdown
      .new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)
      .render(content.to_s)
      .html_safe
  end

  def title(new_title)
    @title = new_title
  end
end
