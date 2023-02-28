# def group_by_owners(files)
#     better_hash = Hash.new{|hash,key| hash[key] = []}
#     files.each_with_object(better_hash){|(k,v),result| result[v] << k}
#   end
  
#   files = {
#     'Input.txt' => 'Randy',
#     'Code.py' => 'Stan',
#     'Output.txt' => 'Randy'
#   }
#   puts group_by_owners(files)

#   def group_by_owners(files)
#     better_hash = {}
#     files.each_with_object(better_hash) do |(k,v),result|
#         (result[v] ||= []) << k
#     end
#   end
  
#   files = {
#     'Input.txt' => 'Randy',
#     'Code.py' => 'Stan',
#     'Output.txt' => 'Randy'
#   }
  
#   puts group_by_owners(files)
def multiplication_table(row, column)
    return if row == 10  
    if column == 10
        puts "\n"
        return multiplication_table(row + 1, 1)
    else
        printf "#{row} * #{column} = %2d ",row * column
        return multiplication_table(row , column + 1)
    end
  end
  
  multiplication_table(1,1)
        
        
        