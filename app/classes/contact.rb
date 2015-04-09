class Contact
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  attr_accessor :name, :email, :subject, :message
  def persisted?
    false
  end
  def initialize
    @name = ''
    @email = ''
    @subject = ''
    @message = ''
  end
end