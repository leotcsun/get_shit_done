#!/usr/bin/ruby

# script to modify the hosts file
# leo sun
# feb 19, 2012
# get shit done!!!

require 'rubygems'
require 'fileutils'
require 'elif'

$block_list = %w(
  youtube.com 
  tieba.baidu.com
  yinyuetai.com
  news.ycombinator.com
  tudou.com
  youku.com
  reddit.com
  deviantart.com
  mongout.com
  weibo.com
  secret-china.com
  douban.com
  verycd.com
  fakkut.net
)

$hosts = '/etc/hosts'
$hosts_cp = '/etc/get_shit_done_hosts'
$mode = ARGV[0]


if $mode == 'work'

  # read the last line to determine
  # if already in working mode
  last_line = Elif.open($hosts) { |f| f.gets }

  if last_line != "# work hosts\n"
    # currently not in working mode
    File.open($hosts, "a+") do |f|
        FileUtils.cp($hosts, $hosts_cp)

        # blank line
        f.puts

        # added in all the blocking sites
        $block_list.each do |i|
          f.puts '127.0.0.1 ' + i
        end
        f.puts '# work hosts'

    end
    puts 'WORK WORK WORK'
  else
    # already in work mode
    puts 'Already using the work hosts'
  end

elsif $mode == 'done'
  # copy back the normal hosts
  FileUtils.cp($hosts_cp, $hosts)
  puts 'PLAY TIME!!!'
end



