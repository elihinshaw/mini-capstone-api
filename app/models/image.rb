class Image < ApplicationRecord
  validates_format_of :url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "image must be png, jpg, or jpeg", multiline: true
end
