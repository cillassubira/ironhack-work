class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class Contact < ActiveRecord::Base
validates :name, presence:true
validates :address, presence:true
# validates :phone_num, length: { is: 9}
# validates_format_of :phone_num, :with =>  /\d[0-9]\)*\z/
# validates :email, email: true

end

 
