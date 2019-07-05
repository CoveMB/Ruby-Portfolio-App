class Portfolio < ApplicationRecord
  include Placeholder

  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :subtitle, :body

  has_one_attached :image

  def self.data_engineering
    where(subtitle: "Data Engineering")
  end

  def self.by_position
    order("position ASC")
  end

end
