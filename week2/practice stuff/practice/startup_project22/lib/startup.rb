require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
      @name = name
      @funding = funding
      @salaries = salaries  #`title` => `salary
      @employees = []
    end

    def valid_title?(title)
      if @salaries.has_key?(title)
        return true
      else 
        return false
      end
    end

    def >(another_startup)
      if self.funding > another_startup.funding
        return true
      else 
        return false
      end
    end

    def hire(employee_name, title)
      if @salaries.has_key?(title)
        new_employee = Employee.new(employee_name, title)
        @employees << new_employee
      else 
        raise "error"
      end
    end

    def size
      @employees.length
    end

    def pay_employee(employee)
      salary =  @salaries[employee.title]
      if @funding >= salary 
        employee.pay(@salaries[employee.title])
        @funding -= salary
      else 
        raise "error"
      end
      
    end

    def payday
      @employees.each  do|employee|
        pay_employee(employee)
      end
    end
    
    def average_salary
      total = 0
      @employees.each do |employee|
        total += @salaries[employee.title]
      end
      total / @employees.length
    end
    
    def close
      @employees = []
      @funding = 0
    end

    def acquire(another_startup)
      @funding += another_startup.funding
      another_startup.salaries.each  do |k, v|
       if !@salaries.has_key?(k)
        @salaries[k] = v
       end      
      end
      @employees += another_startup.employees
      another_startup.close
    end

  

end
