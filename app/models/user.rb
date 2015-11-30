class User < ActiveRecord::Base
  
  # database_authenticatable – Users will be able to authenticate with a login and password that are stored in the database.
  # (password is stored in a form of a digest).
  # registerable – Users will be able to register, update, and destroy their profiles.
  # recoverable – Provides mechanism to reset forgotten passwords.
  # rememberable – Enables “remember me” functionality that involves cookies.
  # trackable – Tracks sign in count, timestamps, and IP address.
  # validatable – Validates e-mail and password (custom validators can be used).

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later # Means that the sending will be queued up
  end
end
