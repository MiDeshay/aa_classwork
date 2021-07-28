
class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss= boss
    end

    def bonus(multiplier)
        @salary *= multiplier
    end

end

class Manager < Employee
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end
    
    def bonus(multiplier)
        salaries_sum = 0
        @employees.each do |employee|
            salaries_sum += employee.salary
        end
        @salary = salaries_sum * multiplier
    end

    def add_employee(employee)
        @employees << employee
    end
end

shawna = Employee.new("Shawna","TA",12000,"Darren")
david = Employee.new("David","TA",10000,"Darren")
darren = Manager.new("Darren","TA Manager", 78000,"Ned")
ned = Manager.new("Ned","Founder",1000000,nil)

darren.add_employee(david)
darren.add_employee(shawna)

ned.add_employee(darren)
ned.add_employee(david)
ned.add_employee(shawna)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000