class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  #空の投稿を保存できないようにする
  validates :image, :name, :category, :status, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, numericality: { other_than: 1 }
end


