class InfoUnit
  
  attr_reader :number
  attr_reader :unit
  attr_reader :bytes
  
  def initialize(*args)
    case args.length
    when 1
      parse(args[0])
    when 2
      @number = args[0]
      @unit   = args[1].to_s
    else
      raise ArgumentError
    end
  end
  
  def bytes
    @number * multiplier if @number
  end
  
  def to_hash
    if @unit && @number
      {
        :number => @number,
        :unit   => @unit,
        :bytes  => bytes,
      }
    else
      {}
    end
  end

  MULTIPLIERS = {
    'B'  => 1,
    'KB' => 1024,
    'MB' => 1048576,
    'TB' => 1073741824,
    'PB' => 1099511627776,
    'EB' => 1125899906842624,
  }
  
  SUFFIX  = "[ ]*(B|KB|MB|TB|PB|EB)$"
  FLOAT   = Regexp.compile("^([0-9\.]+)" + SUFFIX)
  INTEGER = Regexp.compile("^([0-9]+)" + SUFFIX)

  def multiplier
    MULTIPLIERS[@unit]
  end

  def parse(string)
    if INTEGER.match(string)
      @number = Regexp.last_match(1).to_i
      @unit   = Regexp.last_match(2)
    elsif FLOAT.match(string)
      @number = Regexp.last_match(1).to_f
      @unit   = Regexp.last_match(2)
    end
  end
  
end
