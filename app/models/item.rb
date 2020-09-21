class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping_time
  has_one_attached :image
  has_one :order
  has_many :comments, dependent: :destroy


  #空の投稿を保存できないようにする
  validates :image, :name, :description, :category_id, :status_id, :shipping_charge_id, :area_id, :shipping_time_id, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :shipping_charge_id, :area_id, :shipping_time_id, numericality: { other_than: 1 }

  #価格は300円から9999999円の間で設定すること
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
  #価格は半角数字で入力すること
  format: { with: /\A[0-9]+\z/, message: "Please enter in single-byte number" }

end


