module ApplicationHelper
  def markdown(text)
    @text = text
    renderer = Redcarpet::Render::HTML.new
    extensions = {
      tables: true,
      autolink: true,
      hard_wrap: true,
      strikethrough: true,
      fenced_code_blocks: true,
      quote: true,
      highlight: true,
      underline: true,
      footnotes: true
    }
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
end
