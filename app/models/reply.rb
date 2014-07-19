class Reply < ActiveRecord::Base
  include MarkdownBody

  belongs_to :post, inverse_of: :replies, counter_cache: true
end
