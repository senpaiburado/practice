Ransack.configure do |config|
    config.add_predicate 'attached_to',
      arel_predicate: 'attached',
      wants_array: false,
      formatter: proc { |v| v.attached? }
  end
  