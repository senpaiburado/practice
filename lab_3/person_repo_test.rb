require "test/unit"
require "../lab_2/person"
require "../lab_2/person_repository"

class PersonRepositoryTest < Test::Unit::TestCase
  def setup
    @repository = PersonRepository.new
    @person1 = Person.new("Владислав", "Чолак", "AA0123456789", "2000-01-01")
    @person2 = Person.new("Юлія", "Чолак", "AZ0123456789", "1985-05-05")
    @repository.add_person(@person1)
    @repository.add_person(@person2)
  end

  def add_person
    person3 = Person.new("Володимир", "Зеленський", "AA3502890860", "1978-01-25")
    @repository.add_person(person3)
    assert_equal(3, @repository.people.length)
    assert_includes(@repository.people, person3)
  end

  def add_existing_person
    @person1 = Person.new("Владислав", "Чолак", "AA0123456789", "2000-01-01")
    assert_raise(PersonAlreadyExist) { @repository.add_person(duplicate_person) }
  end

  def add_invalid_person
    invalid_person = "Invalid Instance"
    assert_raise(ArgumentError) { @repository.add_person(invalid_person) }
  end

  def edit_person_by_inn
    new_first_name = "Updated"
    new_last_name = "Name"
    new_birth_date = "2000-12-31"
    edited_inn = "AZ0123456789"
    new_person = Person.new(new_first_name, new_last_name, edited_inn, new_birth_date)
    @repository.edit_person_by_inn("AZ0123456789", new_person)
    updated_person = @repository.get_byINN("AZ0123456789")
    assert_equal(new_first_name, updated_person.first_name)
    assert_equal(new_last_name, updated_person.last_name)
    assert_equal(Date.parse(new_birth_date), updated_person.birth_date)
  end


  def delete_person_by_inn
    @repository.delete_person_by_inn("AZ0123456789")
    assert_equal(1, @repository.people.length)
    assert_not_includes(@repository.people, @person1)
  end

  def delete_nonexistent_person
    assert_raise(PersonNotFoundError) { @repository.delete_person_by_inn("inn") }
  end

  def get_all
    all_people = @repository.get_all
    assert_equal(2, all_people.length)
    assert_includes(all_people, @person1)
    assert_includes(all_people, @person2)
  end

  def get_by_inn
    person = @repository.get_byINN("AZ0123456789")
    assert_equal(@person1, person)
  end

  def get_by_part_name
    matching_people = @repository.get_by_part_name("jo")
    assert_equal(1, matching_people.length)
    assert_includes(matching_people, @person1)
    assert_not_includes(matching_people, @person2)

    non_matching_people = @repository.get_by_part_name("xyz")
    assert_empty(non_matching_people)
  end

  def get_by_date_range
    date_from = "1980-01-01"
    date_to = "1995-12-31"
    people_in_range = @repository.get_by_date_range(date_from, date_to)
    assert_equal(2, people_in_range.length)
    assert_includes(people_in_range, @person1)
    assert_includes(people_in_range, @person2)

    date_from = "1990-01-01"
    date_to = "2000-12-31"
    people_in_range = @repository.get_by_date_range(date_from, date_to)
    assert_equal(1, people_in_range.length)
    assert_includes(people_in_range, @person1)
    assert_not_includes(people_in_range, @person2)

    date_from = nil
    date_to = "1989-12-31"
    people_in_range = @repository.get_by_date_range(date_from, date_to)
    assert_equal(1, people_in_range.length)
    assert_includes(people_in_range, @person2)

    date_from = "1990-01-01"
    date_to = nil
    people_in_range = @repository.get_by_date_range(date_from, date_to)
    assert_equal(1, people_in_range.length)
    assert_includes(people_in_range, @person1)

    date_from = nil
    date_to = nil
    all_people = @repository.get_by_date_range(date_from, date_to)
    assert_equal(2, all_people.length)
    assert_includes(all_people, @person1)
    assert_includes(all_people, @person2)
  end
end