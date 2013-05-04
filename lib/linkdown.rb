require_relative 'linkdown/parser'
require_relative 'linkdown/entry'

class Linkdown
  attr_accessor :file

  def initialize(file_name)
    @file = File.new(file_name)
    @parser = Linkdown::Parser.new(@file.read)
  end

  def entries
    @parser.entries
  end

  def likes
    entries.select { |e| e.liked }
  end

  def videos
    entries.select { |e| e.video }
  end

  def read
    entries.select { |e| e.read }
  end

  def unread
    entries.select { |e| !e.read }
  end
end
