class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    tmp = @line.split(" ")
    tmp.shift()
    return tmp.join(" ")
  end

  def log_level
    tmp = @line.split(" ");
    if tmp[0].include? "ERROR"
      return "error"
    elsif tmp[0].include? "WARNING"
      return "warning"
    elsif tmp[0].include? "INFO"
      return "info"
    end
  end

  def reformat
    tmp = @line.split(" ")
    test = tmp[0];
    tmp.shift()
    str = tmp.join(" ")
    if test.include? "ERROR"
      return "#{str} (error)"
    elsif test.include? "WARNING"
      return "#{str} (warning)"
    elsif test.include? "INFO"
      return "#{str} (info)"
    end
  end
end

p LogLineParser.new("[ERROR]: Invalid operation").message
p LogLineParser.new('[INFO]: Timezone changed').log_level

p LogLineParser.new('[INFO]: Operation completed').reformat