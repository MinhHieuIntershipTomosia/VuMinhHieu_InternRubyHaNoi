def make_proc(&block)
  block
end

p proc3 = make_proc { |x| x ** 2 }
