
class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value < Time.now
      record.errors.add attribute, (options[:message] || "can't be in the past!")
    end
  end
end
