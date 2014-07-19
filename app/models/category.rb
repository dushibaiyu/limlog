class Category < ActiveRecord::Base
  has_many :posts, inverse_of: :category

  def self.to_options_hash
    hash = {}

    all.map { |c| [c.name, c.id] }.each do |c|
      id, name = c
      hash[id] = name
    end

    hash
  end

  def to_s
    name
  end

  def to_param
    slug
  end
end
