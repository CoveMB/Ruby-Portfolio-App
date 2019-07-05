module PortfoliosHelper
  def image_generator(height:, width:)
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

  def portfolio_img(img, type)
    p img.class
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    elsif type == 'main'
      image_generator(height: '600', width: '400')
    end
  end
end
