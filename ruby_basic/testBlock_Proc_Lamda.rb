#Proc
def gen_times(factor)
  Proc.new { |n| n * factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

p times3.call(12, 2, 1, 8, 10)             #=> 36
p times5.call(5)                #=> 25
p times3.call(times5.call(4))   #=> 60

#Lamda
l = lambda { |x, y| "x=#{x}, y=#{y}" }
p l.call(1, 2)      #=> "x=1, y=2"
p l.call([1, 2], [1, 2])  #=>  "x=[1, 2], y=[1, 2]"
#l.call(1, 2, 8)    # ArgumentError: wrong number of arguments (given 3, expected 2)
#l.call(1)          # ArgumentError: wrong number of arguments (given 1, expected 2)

#proc diffrent lamda is proc no test quantity argument , lamda has test quantity argument

p = proc { |x, y| x }
l = lambda { |x, y| x }
[[1, 2], [3, 4]].map(&p) #=> [1, 3]
puts [[11, 1, 2, 3, 4, 6, 7, 8, 9, 10]].map(&p) #first elemt of arr [11, 1, 2, 3, 4, 6, 7, 8, 9, 10]
[[[1, 2], 1]].map(&l) # ArgumentError: wrong number of arguments (given 1, expected 2)

#convert of the objects to procs
class Greeter
  def initialize(greeting)
    @greeting = greeting
  end

  def to_proc
    proc { |name| "#{@greeting} , #{name}!" }
  end
end

hi = Greeter.new("Hi")
puts ["Bob", "Jane"].map(&hi).inspect