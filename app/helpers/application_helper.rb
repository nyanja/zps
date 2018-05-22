module ApplicationHelper
  def render_md(md)
    Redcarpet::Markdown
      .new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)
      .render(md)
      .html_safe
  end

  def title(new_title)
    @title = new_title
  end
end
