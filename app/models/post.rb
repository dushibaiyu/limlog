class Post < ActiveRecord::Base
  include MarkdownBody

  has_many   :replies,  inverse_of: :post
  belongs_to :category, inverse_of: :posts
  belongs_to :user,     {
      inverse_of: :posts,
      dependent: :destroy,
      counter_cache: :true,
      foreign_key: 'author_id',
    }

  acts_as_taggable_on :tags

  validates_presence_of   :title, :slug, :body
  validates_uniqueness_of :title, :slug

  scope :desc, ->() { order(created_at: :desc) }
  scope :paginate, ->(index) { page(index) }
  scope :has_tags, ->(*tags) { tagged_with(tags, on: :tags) }

  def author
    user
  end

  def author=(value)
    user = value
  end

  def splitted_markdown_body
    markdown_body.split('<!--more-->').first
  end

  def to_param
    slug
  end
end