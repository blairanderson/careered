class ApiKey < ActiveRecord::Base
  # Default Scope
  # default_scope { where(active: true) }

  # Constants
  # COLORS = %w(red green blue)

  scope :active,  -> { where('expired_at >= ?', Time.now) }

  as_enum :scope, [:session, :api], column: :user_scope_cd

  # Associations
  belongs_to :user

  # Validation
  validates :scope, inclusion: { in: [:session, :api] }

  # Callbacks
  before_create :generate_access_token, :set_expiry_date

  # other macros (like devise's) should be placed after the callbacks
  # Class Methods
  # Instance Methods


  # Private Methods
  private

  def set_expiry_date
    self.expired_at = (self.session? ? 4.hours.from_now : 30.days.from_now)
  end

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
