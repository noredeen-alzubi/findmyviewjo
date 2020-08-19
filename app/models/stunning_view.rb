class StunningView < ApplicationRecord
  ACCEPTABLE_IMG_TYPES = ['image/jpeg', 'image/png'].freeze

  enum overlookings: {city: 0, downtown: 1, skyline: 2, water: 3, countryside: 4, airport: 5, monument: 6}
  belongs_to :city
  has_many_attached :images
  reverse_geocoded_by :latitude, :longitude do |stunning_view,results|
    if geo = results.first
      city = City.where(name: geo.state.camelcase).first || City.create(name: geo.state.camelcase)
      stunning_view.city_id = city.id
    end
  end
  after_initialize :reverse_geocode, if: ->(stunning_view) { stunning_view.latitude.present? && (stunning_view.latitude_changed? || stunning_view.longitude_changed?) }
  validate :acceptable_images

  def thumbnail
    images.first
  end

  private

  def acceptable_images
    return unless images.attached?

    images.each do |image|
      errors.add(:image, 'is too big') unless image.byte_size <= 1.megabyte
      errors.add(:image, 'must be a JPEG or PNG') unless ACCEPTABLE_IMG_TYPES.include?(image.content_type)
    end
  end
end
