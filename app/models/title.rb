class Title < ActiveRecord::Base
  include Slugify::InstanceMethods
  extend Slugify::ClassMethods

  has_many :figure_titles
  has_many :figures, through: :figure_titles
end
