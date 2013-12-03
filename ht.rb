#!/usr/bin/env ruby

require 'webrick'
include WEBrick
s=HTTPServer.new({
  :Port=>8080,
  :BindAddress=>'127.0.0.1',
  :DocumentRoot=>"./",
  :CGIInterpreter=> '/usr/bin/ruby'
  })
s.mount('/index.cgi',WEBrick::HTTPServlet::CGIHandler,'index.rb')
trap("INT") {s.shutdown}
s.start
