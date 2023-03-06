# class Animal
#     @age = 0
#     def initialize(name, age)
#       @name = name
#       @age = age
#     end
#     def name
#         @name
#     end
#     def name=(name)
#         @name = name
#     end
#   end
  
#   ob = Animal.new("Jacky", 3)

# Class getter and setter

# class Orange
#   def initialize(name, address)
#     @name = name
#     @address = address
#   end

#   #getter and setter
#   #getter method
#   def name
#     @name
#   end
#   #setter method
#   def name=(name)
#     @name = name
#   end

#   def show_orange
#     puts "name : #{@name} and address : #{@address}"
#   end
# end

# orange = Orange.new("cam camh" ,"nam dinh")
# orange.show_orange
# #getter method name
# puts orange.name
# #setter mehod
# orange.name = 'cam viet nam'
# orange.show_orange

#attr_reader : getter method, attr_writer : setter method, attr_accessor: create getter and setter method

# class Orange
#   def initialize(name, address)
#     @name = name
#     @address = address
#   end

#   #getter and setter
#   #getter method
#   attr_reader :name
#   #setter method
#   attr_writer :name

#   #getter and setter address
#   attr_accessor :address

#   def show_orange
#     puts "name : #{@name} and address : #{@address}"
#   end
# end

# orange = Orange.new("cam camh" ,"nam dinh")
# orange.show_orange
# puts orange.name

# orange.address = "trung lao - truc ninh - nam dinh"
# orange.show_orange

#instance method and class method
  #instance methods is method called on instance of class
  #use dependent on whether you want to wrok with  level-instance or level-class
  class Person
    def initialize(name, age)
      @name = name
      @age = age
    end
    
    def introduce
      puts "My name is #{@name} and I am #{@age} years old."
    end
  end
  
  person = Person.new("John", 30)
  person.introduce
  # Output: My name is John and I am 30 years old.
  #class methods is method called on class 
  class MathUtils
    def self.average(numbers)
      numbers.inject(:+) / numbers.length.to_f
    end
  end
  
  numbers = [1, 2, 4, 6, 8]
  average = MathUtils.average(numbers)
  puts "The average of #{numbers} is #{average}."
  # Output: The average of [1, 2, 3, 4, 5] is 3.0.
  

  
  
  
  