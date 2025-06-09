module ApplicationHelper
  def markdown(text)
    options = {
      hard_wrap: true,
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      space_after_headers: true,
      lax_spacing: true
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      autolink: true,
      tables: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
    })
    markdown.render(text).html_safe
  end
end