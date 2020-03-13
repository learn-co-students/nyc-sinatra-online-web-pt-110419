class Landmark < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
  
  belongs_to :figure

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(url)
    find {|object| object.slug.include?(url)}
  end

end
