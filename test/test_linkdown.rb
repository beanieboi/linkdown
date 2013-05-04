require 'minitest/autorun'
require_relative '../lib/linkdown'

class TestLinkdown < MiniTest::Unit::TestCase
  def setup
    @file_name = File.join(File.dirname(__FILE__), 'links.md')
    @linkdown = Linkdown.new(@file_name)
  end

  def test_all_lines
    assert_equal 10, @linkdown.entries.count
  end

  def test_likes
    assert_equal 3, @linkdown.likes.count
  end

  def test_videos
    assert_equal 1, @linkdown.videos.count
  end

  def test_read
    assert_equal 8, @linkdown.read.count
  end

  def test_unread
    assert_equal 2, @linkdown.unread.count
  end

end
