#while
puts "loop while"
$i = 0
$num = 5
$sum = 0
while $i < $num
    puts "vong lap chay qua loop = #{$i}"
    $i +=1
    $sum += $i
end


#until
puts "loop until"
$i2 = 0
$num2 = 5
until $i2 > $num2 do
    puts ("vong lap chay qua loop = #$i2")
    $i2 +=1;
end

# ruby
puts "loop for"
for i in 0..5
    if i > 2 then
        break
    end
    puts "i is #{i}"
end
#retry
puts "loop retry"
for i in 0..5
    retry if i > 2
 puts "Value of local variable is #{i}"
 end