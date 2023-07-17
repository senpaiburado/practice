module Validation
    require 'date'
  
    def self.valid_name?(name)
      !(/^[А-ЯІЇҐЄ][А-Яа-яІіЇїҐґЄє\-]{0,38}[А-Яа-яІіЇїҐґЄє]$/.match(name)).nil? &&
      name.split('-').all? do |word| 
        word[0] == word[0].upcase && !word.empty? && word[1..-1] == word[1..-1].downcase
      end &&
      (name.count('-') == 0 || (name.count('-') > 0 && !name.split('-').last.empty?))
    end
  
    def self.valid_date_of_birth?(dob)
      dob.is_a?(Time) && dob < Time.now
    end
  
    def self.valid_id?(id)
      !(/^[A-Z]{2}\d{10}$/.match(id)).nil?
    end
  end
  