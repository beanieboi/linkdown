class Linkdown
  class Entry
    FLAGS = { video: 'v', read: 'x', liked: '<3' }

    attr_reader :video, :read, :liked, :url

    def initialize(flags, url)
      @flags  = split_flags(flags)
      @url    = url
      parse_flags
    end

    def split_flags(flags)
      _flags = flags.split("")
      if _flags.include?("<") && _flags.include?("<")
        _flags.delete_at(_flags.index("<"))
        _flags.delete_at(_flags.index("3"))
        _flags << "<3"
      end

      _flags
    end

    def parse_flags
      FLAGS.each do |k,v|
        writer_flag = "@#{k}".to_sym

        if @flags.include?(v)
          self.instance_variable_set(writer_flag, true)
        else
          self.instance_variable_set(writer_flag, false)
        end
      end
    end
  end
end
