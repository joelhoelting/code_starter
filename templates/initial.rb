# 1. `gem install pry`
# 2. Insert `binding.pry` into code

#!/usr/bin/ruby

require 'pry'

def add(x,y)
  total = x + y
  binding.pry
end

add(2,3)
