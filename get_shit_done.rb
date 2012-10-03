# script to modify the hosts file
# leo sun
# get shit done!!!

require 'rubygems'
require 'fileutils'

$block_list = %w(
  www.youtube.com
  www.weibo.com
  weibo.com
  www.tieba.baidu.com
  www.yinyuetai.com
  news.ycombinator.com
  www.tudou.com
  www.youku.com
  www.reddit.com
  www.deviantart.com
  www.mongout.com
  www.secret-china.com
  bbs.secret-china.com
  www.douban.com
  www.verycd.com
  www.fakkut.net
  www.head-fi.org
  www.facebook.com
  ruby-china.org
)

$hosts = '/etc/hosts'
$hosts_cp = '/etc/get_shit_done_hosts'
$mode = ARGV[0]


if $mode == 'work'

  # read the last line to determine
  # if already in working mode
  contents = ""
  File.open("#{$hosts}", "rb") do |f|
    contents = f.read
  end

  unless contents.include?("work hosts")
    File.open($hosts, "a+") do |f|
      f.puts '# work hosts'
      FileUtils.cp($hosts, $hosts_cp)
      f.puts

      $block_list.each do |i|
        f.puts '127.0.0.1 ' + i
      end

    end
    puts 'WORK WORK WORK'
  else
    puts 'Already using the work hosts'
  end

elsif $mode == 'done'
  FileUtils.cp($hosts_cp, $hosts)
  puts 'PLAY TIME!!!'
else
  puts 'Need an argument!'
end



