require_relative "console_input"

class Person
    include Validation
    include ConsoleInput
  
    attr_reader :given_name, :surname, :id_number, :date_of_birth
  
    def initialize(given_name, surname, id_number, date_of_birth)
      update_given_name(given_name)
      update_surname(surname)
      update_id_number(id_number)
      update_date_of_birth(date_of_birth)
    end
  
    def given_name=(new_given_name)
      update_given_name(new_given_name)
    end
  
    def surname=(new_surname)
      update_surname(new_surname)
    end
  
    def id_number=(new_id_number)
      update_id_number(new_id_number)
    end
  
    def date_of_birth=(new_date_of_birth)
      update_date_of_birth(new_date_of_birth)
    end
  
    private
  
    def update_given_name(given_name)
      if valid_name?(given_name)
        @given_name = given_name
      else
        raise "This given name is not allowed!"
      end
    end
  
    def update_surname(surname)
      if valid_name?(given_name)
        @surname = surname
      else
        raise "This surname is not allowed!"
      end
    end
  
    def update_id_number(id_number)
      if valid_id?(id_number)
        @id_number = id_number
      else
        raise "This ID number is not allowed!"
      end
    end
  
    def update_date_of_birth(date_of_birth)
      if valid_date_of_birth?(date_of_birth)
        if Date.parse(date_of_birth) < Date.today
          @date_of_birth = date_of_birth
        else
          raise "This seems to be a future date, please enter the correct date!"
        end
      else
        raise "This date format is not allowed!"
      end
    end
  end
  