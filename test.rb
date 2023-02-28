# Test Symbol
str = "hello world"
puts str
puts str[0]
str[0] = "H"
puts str

h = :hash
puts h
puts h[1]
# h[0] = "H" --> loi
puts h

# so sanh hieu suat Symbol voi String
# String 
puts "hello world".object_id
puts "hello world".object_id
puts "hello world".object_id
# Symbol
puts :"hello world".object_id
puts :"hello world".object_id
puts :"hello world".object_id

# Mot so cach khai bao Symbol
symbol = :hello
puts symbol
symbol1 = :"hello"
puts symbol1
symbol2 = "hello".intern
puts symbol2
symbols = %i(a b c) #khai bao 1 mang symbol ma khong can dau :
puts symbols
# chuyen doi giua string va symbol
# 1. Tu Symbol sang String su dung method to_s
  symboltest = :hello
  puts "symboltest #{symboltest}"
  symboltest.to_s 
  puts "symboltest convert to String #{symboltest} "

# 2. chuyen doi tu String sang symbol su dung method to_sym
  symboltest2 = "hello"
  puts "symboltest2 #{symboltest2}"
  symboltest2.to_sym
  puts "symboltest convert to symbol #{symboltest2}"

# 3.lam viec voi mang
  #.Them phan tu vao mang
  a = [1, 2, 3, 4, 5, 6]
  puts a[0]
  a.push(5)
  a.unshift(0)
  a.insert(4,"hi")
  print a
  print "\n"
  #.Loai bo cac phan tu khoi mang
  b = [0, 1, 2, 3, 4, 5, 6]
  b.pop #xoa phan tu vi tri cuoi
  b.shift #xoa phan tu vi tri dau
  b.delete_at(2) #xoa phan tu o vi tri thu 2
  b.delete(5) #xoa phan tu co gia tri 5
  print b
  print "\n"
  #.Cac thao tac khac
  #compact
  c = [1, 1, nil, 3, 4, nil, 5];
  c.compact!;
  print 'mang c la : '
  print c
  print "\n"
  #uniq
  d = [1, 1, 1, 2, 2, 3, 3, 3, 4, 4]
  d.uniq!
  print 'mang d la : '
  print d
  print "\n"

#4.lam viec voi hash
  # khai bao mot hash
  hash = {'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 12 => 'dodecine'}
  hash1 = {name: "John", age: 30, city: "New York"}
  # truy cap den key trong hash bang cach su dung hash[key]
  hash.default = "tomosia vmhieu"
  puts hash['dog'] # return canine beacuse key 'dogs' exist value in hash
  puts hash[ :name] #reutrn "tomosia vmhieu" because :name not exist value in hash then it's return default
  # compare two hash found key-value has suitable and corresponding (tuong ung va phu hop) in each hash (trong moi hash) size --> (key,value) not improtant index of element in hash
  h1 = {a:1, b:2}
  h2 = {a:1, d:3, b:2}
  print "So sanh h1 voi h2 :"
  print h1 < h2
  print "\n"
  # assigin vaule in hash (gan gia tri cho value trong hash)
  hashTestAssigin = { "a" => 100, "b" => 200 }
  hashTestAssigin["a"] = 03102001
  hashTestAssigin["b"] ="vmhieu"
  puts hashTestAssigin
  # clear : remove all key-value has in hash
  hashTestClear = { "a" => 100, "b" => 200 }
  hashTestClear.clear
  puts hashTestClear
  # delete : delete a key-value return value with key corresponding .if key not found then it's return value default
  hashTestDelete = { "a" => 100, "b" => 200 }
  hashTestDelete.delete("a");
  puts hashTestDelete
  # keys :  get all keys
  hashTestKey = { "a" => 100, "b" => 200, "c" => 300 }
  print hashTestKey.keys
  print "\n"
  # values : get all values (lay ra tat ca gia tri)
  hashTestvalue = { "a" => 100, "b" => 200, "c" => 300 }
  print hashTestvalue.values
  print "\n"
  # each vs each_pair
  # compare each vs each_pair
  # each : iterator over each element
  # each_pair : accsess to each (key-value) of element
  hashTestEach = {"name" => "Alice", "age" => 30, "city" => "New York"}
  hashTestEach.each do |key, value|
    print "#{key} : #{value} ,"
  end
  print "\n"

  hashTestEach.each_key do |key|
    puts key
  end
  print "\n"

  hashTestEach.each_value do |value|
    puts value
  end
  #empty : test hash has empty ==> resulut returned true or fasle
  hashTestEmpty = {}
  puts  "hash is empty : #{hashTestEmpty.empty?}"
  #has_key?(key) : test key have in hash? ==> retutrn true or fasle
  hashTesthas_key = { "a" => 100, "b" => 200 }
  puts "hash have key a : #{hashTesthas_key.has_key?("a")}"
  puts "hash have key c : #{hashTesthas_key.has_key?("c")}"
  # merge in hash : merge two hash with method : hash1.merge(hash2) then return new hash by hash1
  # shift : remove (key-value) first in hash or remove value default if hash empty
  # size : return number of pairs (key-value) trong hash
  # to_a : this method will convert hash to array --> it's a array where (key-value) is sub-array
  arr = [1,2,3,4,5,6,7,8,9]
  arr.each do |n|
    puts "bang cuu chuong #{n}"
    puts "#{n} * 1 = #{n * 1}"
    puts "#{n} * 2 = #{n * 2}"
    puts "#{n} * 3 = #{n * 3}"
    puts "#{n} * 4 = #{n * 4}"
    puts "#{n} * 5 = #{n * 5}"
    puts "#{n} * 6 = #{n * 6}"
    puts "#{n} * 7 = #{n * 7}"
    puts "#{n} * 8 = #{n * 8}"
    puts "#{n} * 9 = #{n * 9}"
  end
  #5. Loop in Ruby

  i = 0
loop do
    i += 1
    if i == 5
      break
    end
    puts i

end





