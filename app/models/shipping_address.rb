class ShippingAddress < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :order
  # belongs_to_active_hash :prefectures
  belongs_to :order
end

