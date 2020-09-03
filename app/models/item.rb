class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_time
  #空の投稿を保存できないようにする
  validates :image, :name, :category, :status, :shipping_charge, :area, :shipping_time, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charge, :area, :shipping_time, numericality: { other_than: 1 }
end


