module Validation
    require 'date'
  
    def self.valid_name?(name)
      !(/^[А-ЯІЇҐЄ][А-Яа-яІіЇїҐґЄє\-]{0,39}$/.match(name)).nil? &&
      name.split('-').all? { |word| word[0] == word[0].upcase }
    end
  
    def self.valid_date_of_birth?(dob)
      dob.is_a?(Time) && dob < Time.now
    end
  
    def self.valid_id?(id)
      !(/^[A-Z]{2}\d{10}$/.match(id)).nil?
    end
  end
  