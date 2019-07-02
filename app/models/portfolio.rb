class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image

  def self.data_engineering
    where(subtitle: "Data Engineering")
  end
end
