class Animal
    @age = 0
    def initialize(name, age)
      @name = name
      @age = age
    end
    def name
        @name
    end
    def name=(name)
        @name = name
    end
    def age
        @age
    end
    def age=(age)
        @age = age
    end
  end
  
  ob = Animal.new("Jacky", 3)
  puts ob.name
  puts ob.age