class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    email_regex = /\A[^@\s]+@[^@\s]+\z/

    if not email_regex.match(value)
      record.errors[attribute] << "#{attribute} is not a valid email address"
    end
  end
end
