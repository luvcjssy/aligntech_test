class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  accepts_nested_attributes_for :order_details

  enum status: { to_pay: 0, to_ship: 1, to_receive: 2, completed: 3, cancelled: 4, return_refund: 5 }

  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_email, -> (email) { where("order_email like ?", "#{email}%")}
end
