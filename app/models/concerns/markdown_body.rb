module MarkdownBody
  extend ActiveSupport::Concern

  def markdown_body
    options = {
        autolink:            true,
        hard_wrap:           true,
        strikethrough:       true,
        no_intra_emphasis:   true,
        fenced_code_blocks:  true,
        space_after_headers: true
    }
    markdown = Redcarpet::Markdown.new(CustomHTML, options)
    markdown.render(body)
  end

  class CustomHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      require 'pygments'
      Pygments.highlight(code, lexer: language)
    end
  end
end