class Page < ActiveRecord::Base
  include MarkdownBody

  has_many :replies, inverse_of: :page

  validates_presence_of   :title, :slug, :body
  validates_uniqueness_of :title, :slug

  def splitted_markdown_body
    markdown_body.split('<!--more-->').first
  end

  def to_param
    slug
  end
end
