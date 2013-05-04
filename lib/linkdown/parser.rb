class Linkdown
  class Parser
    def initialize(content)
      @content = content
      @parsed = false
      @entries = nil
    end

    def entries
      @entries ||= @content.split("\n").map do |line|
        _matches = line.match(/^- \[(.*)\] (.*)$/)
        flags = _matches[1]
        url   = _matches[2]
        Linkdown::Entry.new(flags, url)
      end
    end
  end
end
