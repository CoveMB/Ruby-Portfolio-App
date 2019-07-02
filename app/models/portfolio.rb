class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  def self.data_engineering
    where(subtitle: "Data Engineering")
  end

  after_initialize :set_defaults
end
