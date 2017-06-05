class Employee
  attr_accessor :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.employees << self unless boss.nil?
  end


  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees

=begin

  *boss


=end



  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def salary
  end

  def bonus(multiplier)
    @employees.map(&:salary).reduce(:+) * multiplier
  end

end
