#!/usr/bin/env ruby

require 'cgi'

cgi=CGI.new('html3')
cb=Array.new(5)

cb[0]=cgi['cb0']

f=<<"EOM"
cb[0]=#{cb[0]}</br>
<form action='index.cgi' method='POST'>
<input type="checkbox" name="cb0" value="ON" #{"Checked" if cb[0]=="ON"}>
<input type="submit" name="exec" value="submit">
</form>
EOM


cgi.out{
  cgi.html{
    cgi.head{
      cgi.title{ "Ruby CGI Test" }
    } +
    cgi.body{
      "Hello World!!</br>" + f
    }
  }
}
