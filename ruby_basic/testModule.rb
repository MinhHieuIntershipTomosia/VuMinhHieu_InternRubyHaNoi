#module_function : is a method is defined in module can use directly without having to include modulde in class
#when use module_function in module then method belongs only to the module if class include module then no use this method
module MyFirstModule
  def say_hello
    puts "Hello, world!"
  end

  module_function :say_hello

  def say_hello2
    puts "Hello, world2!"
  end
end

class Greeter
  include MyFirstModule
end

#Call method:
Greeter.new.say_hello2
MyFirstModule.say_hello

# MyFirstModule.say_hello

# include vs extend
# khong the class extend class chi co class extends module
# include : include method then method of module impoort is instance method
# extend : extend method then method of module impoort is class method
module MyModule
  def foo
    puts "Hello from foo!"
  end
end

module MyClass
  def bar
    puts "Hello from bar!"
  end
end

class MyOtherClass
  include MyModule
  extend MyClass
end

MyOtherClass.new.foo
MyOtherClass.bar

#  puts Module.instance_methods(false).sort.inspect
