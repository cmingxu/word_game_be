class MonsterConfig
  @options = {
    host: "localhost",
    port: 3456
  }

  File.open(File.expand_path(File.join(File.dirname(__FILE__), "..", "config"))).each_line do |line|
    next unless line =~ /^(\w+)\s*=\s*(\w+)$/
    @options[line.split("=")[0].strip] = line.split("=")[1].strip
  end

  class << self
    def get(key)
      value = @options[key] || default
      value =~ /^(\d+)$/ ? value.to_i : value 
    end

    alias :[] :get
  end
end
