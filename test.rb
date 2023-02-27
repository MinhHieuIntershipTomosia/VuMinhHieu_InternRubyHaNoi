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




