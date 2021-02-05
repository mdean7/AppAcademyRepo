require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
    @salaries.has_key?(title)
    end

    def >(other_startup)
      self.funding > other_startup.funding
    end

    def hire(employee_name, title)
     self.valid_title?(title) ? (@employees << Employee.new(employee_name, title)) : (raise 'Invalid title' )
    end


    def size
        @employees.size
    end

    def pay_employee(employee)
        pay = @salaries[employee.title]
        if pay < @funding
            employee.pay(pay)
            @funding -= pay
       else
            raise 'Startup does not have enough funding to pay the employee'
       end
    end

    def payday
        @employees.each{|employee| pay_employee(employee) }
    end
    

    def average_salary        
       sum = @employees.map { |employee| @salaries[employee.title]}
       sum.sum / sum.size        
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding 
        other_startup.salaries.each do |title, salary|
        if !@salaries.has_key?(title) 
         @salaries[title] = other_startup.salaries[title]
        end
    end
    @employees += other_startup.employees
    other_startup.close
    end
    
end