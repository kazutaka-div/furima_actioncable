class PayForm
  include ActiveModel::Model
  attr_accessor :item_id, :token, :postal_code, :prefecture, :city, :addresses, :building, :phone_number, :user_id

  # <<バリデーション>>
  with_options presence: true do
    validates :item_id
    validates :token, presence: { message: "can't be blank" }
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :prefecture, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :addresses
    # 数字以外でも登録できてしまうが、必須ではなく推奨と案内。
    # validates :phone_number, length: { maximum: 11, message: 'Too long' }
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'Too long' }
    # 電話番号は入力フォームで制限してますが、一応つけています。
    validates :user_id
  end

  def save
    order = Order.create(
      item_id: item_id,
      user_id: user_id
    )
    Address.create(
      order_id: order.id,
      postal_code: postal_code,
      prefecture: prefecture,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number
    )
  end
end
