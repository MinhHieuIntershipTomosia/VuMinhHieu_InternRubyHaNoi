# class LogLineParser
#   def initialize(line)
#     @line = line
#   end

#   def message
#     tmp = @line.split(" ")
#     tmp.shift()
#     return tmp.join(" ")
#   end

#   def log_level
#     tmp = @line.split(" ");
#     if tmp[0].include? "ERROR"
#       return "error"
#     elsif tmp[0].include? "WARNING"
#       return "warning"
#     elsif tmp[0].include? "INFO"
#       return "info"
#     end
#   end

#   def reformat
#     tmp = @line.split(" ")
#     test = tmp[0];
#     tmp.shift()
#     str = tmp.join(" ")
#     if test.include? "ERROR"
#       return "#{str} (error)"
#     elsif test.include? "WARNING"
#       return "#{str} (warning)"
#     elsif test.include? "INFO"
#       return "#{str} (info)"
#     end
#   end
# end

# p LogLineParser.new("[ERROR]: Invalid operation").message
# p LogLineParser.new('[INFO]: Timezone changed').log_level

# p LogLineParser.new('[INFO]: Operation completed').reformat

# ----------------------------------------------------------
# class TwoFer
#   def self.two_fer(name = "you")
#     puts "One for #{name}, one for me."
#   end
# end

# # Gọi phương thức two_fer trên lớp TwoFer
# TwoFer.two_fer("Alice")
# TwoFer.two_fer

# ----------------------------------------------------------

# class Tournament
#   def self.tally(str="")
#     str = str.split("\n")
#     scores = Hash.new { |h, k| h[k] = [0, 0, 0, 0, 0] }
#     str.each do |item|
#       teams1, teams2, result = item.split(";")
#       case result.to_sym
#       when :win
#         scores[teams1][0] += 1
#         scores[teams2][0] += 1
#         # caculate win
#         scores[teams1][1] += 1
#         # caculate loss
#         scores[teams2][3] += 1
#         #caculate point
#         scores[teams1][4] += 3
#       when :loss
#         scores[teams2][0] += 1
#         scores[teams1][0] += 1
#         # caculate win
#         scores[teams2][1] += 1
#         #caculate loss
#         scores[teams1][3] += 1
#         #caculate point
#         scores[teams2][4] += 3
#       when :draw
#         scores[teams2][0] += 1
#         scores[teams1][0] += 1
#         # caulate draw
#         scores[teams1][2] += 1
#         scores[teams2][2] += 1
#         #caculate point
#         scores[teams1][4] += 1
#         scores[teams2][4] += 1
#       end
#     end

#     hash = scores.sort_by { |key, value| [-value.sum,key] }.to_h
#     teams = []
#     hash.each { |key, value| teams << value.unshift(key) }
#     result = "Team                           | MP |  W |  D |  L |  P\n"
#     teams.each do |element|
#       result += "%-30s | %2d | %2d | %2d | %2d | %2d\n" % element
#     end
#     return result;
#   end
# end

# class

#  puts Tournament.tally("Allegoric Alaskans;Blithering Badgers;win")

# class Complement
#   def self.of_dna(str = "")
#     str = str.split("")
#     result = ""
#     str.each do |element|
#       case element.to_sym
#       when :G
#         result += "C";
#       when :C
#         result += "G";
#       when :T
#         result += "A";
#       when :A
#         result += "U";
#       end
#     end
#     return result;
#   end
# end
# puts Complement.of_dna("C")


class Diamond
  def self.diamond(str = "A")
    diamond_string = "";
    arr = ('A'..str).to_a;
    n = (arr.length * 2) - 1;
    n.times do |i|
      space_count = (i - n / 2).abs
      asterisk_count = n - space_count * 2
      space_center_count = (asterisk_count - 2 > 0)? (asterisk_count - 2) : 0;
      #chi ding vi tri in
      index = (i- arr.length + 1 > 0)? (arr.length - i -2) : i;
      puts arr[index]
      if space_center_count > 0
        diamond_string << [' ' * space_count, arr[index] , '' * space_center_count , arr[index]].join + "\n"
      else
        diamond_string << [' ' * space_count,  arr[index]].join + "\n"
      end
      # # diamond_string << [' ' * space_count, '*' * asterisk_count].join + "\n"
    end
  
    return diamond_string
  end
end

puts Diamond.diamond('E')



