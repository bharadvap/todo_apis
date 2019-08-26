class User < ApplicationRecord

  #
  ## Devise options
  #
  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :validatable
  )

  #
  ## Validations
  #
  validates(
    :first_name,
    presence: true
  )

  validates(
    :last_name,
    presence: true
  )

  #
  ## Assocations
  #
  has_many :todo_lists


  #
  ## Method to update JWT token once user is loged in.
  #
  def generate_user_auth_token
    JWT.encode(
      { id: id, exp: 5.days.from_now.to_i },
      Rails.application.secrets.secret_key_base
    )
  end
end
