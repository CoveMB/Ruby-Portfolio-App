class Portfolio < ApplicationRecord
  validate_presence_of :title, :subtitle, :body, :main_image, :thumb_image
end
