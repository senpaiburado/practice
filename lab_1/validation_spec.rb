require 'rspec'
require_relative 'validation'

describe Validation do
  describe ".valid_name?" do
    it "Повертає true для валідного імені" do
      expect(Validation.valid_name?('Владислав')).to eq(true)
    end

    it "Повертає true для валідного імені 2" do
      expect(Validation.valid_name?('Анна-Марія')).to eq(true)
    end

    it "Повертає true для валідного імені 3" do
      expect(Validation.valid_name?('Анна-Марія-Вікторія-Анна')).to eq(true)
    end

    it "Повертає true для невалідного імені (з малої букви)" do
      expect(Validation.valid_name?('Анна-Марія-вікторія-Анна')).to eq(false)
    end

    it "Повертає true для невалідного імені (замість дефісу - крапка)" do
      expect(Validation.valid_name?('Анна.Марія')).to eq(false)
    end

    it "Повертає false для невалідного імені" do
      expect(Validation.valid_name?('1234')).to eq(false)
    end
  end

  describe ".valid_date_of_birth?" do
    it "Повертає true для валідної дати народження" do
      expect(Validation.valid_date_of_birth?(Time.new(2000, 01, 01))).to eq(true)
    end

    it "Повертає true для валідної дати народження" do
      expect(Validation.valid_date_of_birth?(Time.now - 1)).to eq(true)
    end

    it "Повертає false для невалідної дати народження" do
      expect(Validation.valid_date_of_birth?(Time.new(2100, 01, 01))).to eq(false)
    end

    it "Повертає false для невалідної дати народження" do
      expect(Validation.valid_date_of_birth?(Time.now + 1)).to eq(false)
    end
  end

  describe ".valid_id?" do
    it "Повертає true для валідного ІІН" do
      expect(Validation.valid_id?('AB1234567890')).to eq(true)
    end

    it "Повертає false для невалідного ІІН" do
      expect(Validation.valid_id?('1234567890')).to eq(false)
    end

    it "Повертає false для невалідного ІІН (є мала літера)" do
      expect(Validation.valid_id?('Az1234567890')).to eq(false)
    end

    it "Повертає false для невалідного ІІН (літери не латиницею)" do
      expect(Validation.valid_id?('ІЙ1234567890')).to eq(false)
    end
  end
end
