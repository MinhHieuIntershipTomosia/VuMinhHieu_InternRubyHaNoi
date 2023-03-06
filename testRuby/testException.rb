begin
  1 / 0
rescue
  puts "khong chia duoc cho 0"
end

#object exception
begin
  1 / 0
rescue ZeroDivisionError => e
  puts "Exception Class: #{e.class.name}"
  puts "Exception Message: #{e.message}"
  puts "Exception Backtrace: #{e.backtrace}"
end

#raise exception
begin
  raise ArgumentError.new("Day la loi")
rescue ArgumentError => e
  puts e.message
end

#custom exception
class PermissionDeniedError < StandardError
  attr_reader :action

  def initialize(message, action)
    super(message)
    @action = action
  end
end

raise PermissionDeniedError.new("khong co quyen truy cap", :delete)