class City < ApplicationRecord
  has_many :stunning_views

  def to_s
    name
  end

  def self.search(term)
    where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
  end

end