class NewsletterForm < Reform::Form
  include Reform::Form::ActiveModel
  include Reform::Form::ActiveModel::FormBuilderMethods

  property :name
  property :filters
  property :start_at
  property :text

  validates :name, :filters, :start_at, presence: true

  validate :filters_is_array?, :filters_have_fields?


  def save
    sync.save
  end

  private

  def filters_is_array?
    errors.add(:filters, 'should be array') unless filters.class == Array
  end

  def filters_have_fields?
    if filters.class == Array
      filters.each do |filter|
        errors.add(:filters, 'should contain key prop_name') unless filter.has_key? :prop_name
        errors.add(:filters, 'should contain key logic') unless filter.has_key? :logic
        errors.add(:filters, 'should contain key value') unless filter.has_key? :value
      end
    else
      errors.add(:filters, 'should contain key prop_name')
      errors.add(:filters, 'should contain key logic')
      errors.add(:filters, 'should contain key value')
    end
  end



end