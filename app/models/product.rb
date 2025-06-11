require 'carrierwave/mongoid'

class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  include GlobalID::Identification

  has_many :subscribers, dependent: :destroy
  field :name, type: String
  field :description, type: String
  mount_uploader :featured_image, FeaturedImageUploader
  field :inventory_count, type: Integer 

  after_update :notify_subscribers, if: :back_in_stock?

  def back_in_stock?
    inventory_count_previously_was.zero? && inventory_count > 0
  end

  def notify_subscribers
    subscribers.each do |subscriber|
      ProductMailer.with(product_id: id, subscriber_id: subscriber.id).in_stock.deliver_later
    end
  end

  
  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
end
