# Đọc toàn bộ nội dung của file vào một biến
# chỉ định file đọc cần xác định đường dẫn hiện tại file dang làm việc
s = File.read('testRuby/example.txt')
puts s

s = File.read('../../Desktop/note.txt')
puts s

# Đọc từng dòng của file vào một mảng
file = File.open("../../Desktop/note.txt", "r")
data = file.read
puts data
file.close

File.readlines("../../Desktop/note.txt").each {
    |line| puts " --- #{line}"
  }
# Tạo file và mở file

file = File.new("./asset/note/noteFileRuby.txt", "w+")
file.puts "Các chế độ mở file"
file.puts "r chế độ chỉ đọc, bắt đầu từ đầu file - đây là chế độ mặc định"
file.puts "r+ chế độ đọc - ghi, bắt đầu từ đầu file"
file.puts "w chỉ ghi, file đã tồn tại thì bị cắt về rỗng"
file.puts "w+ chế độ đọc ghi, file tồn tại thì bị cắt về rỗng"
file.puts "a ghi ghi, nối thêm dữ liệu nếu đã tồn tại"
file.puts "a+ đọc, ghi nối thêm dữ liệu nếu đã tồn tại"

