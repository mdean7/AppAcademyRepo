require './item.rb'
require './list.rb'
class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            @list.up(*args)
        when 'down'
            @list.down(*args)
        when 'swap'
            @list.swap(*args)
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.priority
        when 'print'
            @list.print(*args)
        when 'help'
            puts"---LIST OF COMMANDS--- \n #{'mktodo'.center(18)} \n #{'up'.center(18)} \n #{'down'.center(18)} \n #{'swap'.center(18)} \n #{'sort'.center(18)} \n #{'priority'.center(18)} \n #{'print'.center(18)} \n #{'help'.center(18)} \n #{'quit'.center(18)}"
            puts"----------------------"
        when 'quit'
            exit
            return false
        else
            print "Sorry, that command is not recognized."
        end
        true
    end

    def run
        
        while get_command == true
            get_command
        end   
         
    end

end