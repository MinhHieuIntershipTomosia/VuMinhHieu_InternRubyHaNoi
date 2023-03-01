
#& : use #& vd: a&b ==> return a array include the elements of two array a and b

a = [1, 2, 3, 4, 5]
b = [4, 5, 6, 7, 8]
puts a&b

#inspect to convert a object into a format string
puts (a&b).inspect #==> [4, 5]
#* use multiply an integer  with a array or a String , if multiply not integer ==> return error
str = "vmhieu"
arrMutiply = [1,2,3,4,5,6,7]
testStr = (str*2).inspect
testArr = arrMutiply * 3
puts testStr #==> "vmhieuvmhieu"
puts testArr.inspect #==> [1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7, 1, 2, 3, 4, 5, 6, 7]
#+ use add all element of two array in a new array
arr1 = [0,1,2]
arr2 = ["vu minh hieu","trung lao","truc ninh","nam dinh"]
arrTestAdd = arr1 + arr2 
puts arrTestAdd.inspect # ==> [0, 1, 2, "vu minh hieu", "trung lao", "truc ninh", "nam dinh"]
# arrTestAdd1 = arr1 + "Nam dinh numberone"# ==> Error beacause arr1 vs " " not same data type
# puts arrTestAdd1.inspect 
#- : arr1 - arr2 return a new array doesn't contain elements arr2
arr = [1,2,3,4,6,5,7,8] 
arrOther = [1,2,3,4,3]
puts (arr - arrOther).inspect #[6, 5, 7, 8]
#<< : add a string or a number or a array at the end of array
arr = ["vu minh hieu","nam dinh"]
puts (arr<<["03/10/2001","trung lao"]).inspect
#<=> : return -1,0,1 ex: arr1 <=> arr2 
    # if arr1, arr2 same size and (first element arr1 < first element arr2) ==> return -1
    # if arr1, arr2 same size and  (first element arr1 > first element arr2) ==> return 1
    # if arr1, arr2 same size , same element ==> return 0
    # if diffrent size and element ,arr has langer size is langer
arr1 = [1,2,3]
arr2 = [1,3,4]
puts arr1 <=> arr2 #-1 beacause 2<3 ==> arr1 < arr2 ==> -1
puts arr2 <=> arr1 # 1 beacause 3>2 ==> arr2 > arr1 ==> 1
#== ex: arr1 == arr2 : return true or false
    # if return true : if arr1 , arr2 same size and arr1[index] == arr2[index]
    # else return fasle;
arr1 = [1,2,3,4]
arr2 = [1,2,3,4]
arr3 = [1,3,4,3]
puts arr1 == arr2 #true 
puts arr1 == arr3 #false
#[] :update element in array 
    #if arr[index] = value : index > length of arr then it arr with length is index and element not assign value will equal nil 
arr = [0,1,2,3,4]
arr[0]=1
puts arr.inspect # [1, 1, 2, 3, 4]
arr[6]=5 #[1, 1, 2, 3, 4, nil, 5] because index > arr.size
arr[7]=10 #=> reurn [1, 1, 2, 3, 4, nil, 5]  because index > arr.size
puts arr.inspect 
#all? : return true or false
    #if no block given and no argument ==> return true if arr all elemnt == true
    puts [0, nil, 2].all? # => false because has element has value = nil
    # if has block given and no argument ==> return true if all element correct condition in block 
    puts [0, 1, 2].all? { |element| element < 3 } #true
    puts [0, 1, 2].all? { |element| element < 2 } # => false
    # if argument will check all element has element === argument ==> return true
    puts ['food', 'fool', 'foot'].all?(/foo/) # => true   
#any? : return true or false 
    #if no block given and no argument, return true if has element == true else return false
    puts [nil, 0, false].any? # => true
    puts [nil, false].any? # => false
    puts [].any? #=>false
    # if has block given and no argument ==> return true if all element correct condition in block 
#append
#assoc
#at
#bsearch
#bsearch_index
# puts Array.instance_methods(false).sort.inspect
