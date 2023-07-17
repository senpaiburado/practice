require "../lab_1/validation.rb";

module ConsoleInput
    def receive_string_input()
      input = nil
      until input.is_a?(String)
        puts "Enter string value: "
        input = gets.strip
      end
      input
    end
  
    def receive_name_input()
      input = nil
      until input && valid_name?(input)
        puts "Enter name-formatted value (e.g., Анна-Вікторія): "
        input = gets.strip
      end
      input
    end
  
    def receive_integer_input()
      input = nil
      until input && input.match?(/\A[0-9]+\z/)
        puts "Enter integer value: "
        input = gets.strip
      end
      input.to_i
    end
  
    def receive_inn_input()
      input = nil
      until input && valid_id?(input)
        puts "Enter inn-formatted value (e.g., AB1234567890): "
        input = gets.strip
      end
      input
    end
  
    def correct_date_format?(input)
      /^\d{4}-\d{2}-\d{2}$/.match?(input) && Date.parse(input)
    rescue ArgumentError
      false
    end
  
    def receive_date_input()
      input = nil
      until input && valid_date_of_birth?(input)
        puts "Enter valid date value in yyyy-mm-dd format: "
        input = gets.strip
      end
      Date.parse(input)
    end
  
    private :correct_date_format?
  end
  