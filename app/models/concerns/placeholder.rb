module Placeholder
  extend ActiveSupport::Concern

  def image_generator(height, width)
    "http://placehold.it/#{height}x#{width}"
  end

  def set_defaults
    if self.class == Portfolio
      self.main_image ||= image_generator('600', '400')
      self.thumb_image ||= image_generator('350', '200')
    elsif self.class == Skill
      self.badge ||= image_generator('250', '250')
    end
  end

end
