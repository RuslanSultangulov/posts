# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true

  scope :already_published, -> { where(published: true) }

  def title_and_body
    "#{title}: #{body}"
  end
end
