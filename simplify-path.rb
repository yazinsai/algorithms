=begin
Given an absolute path for a file (Unix-style), simplify it.

For example,
path = "/home/", => "/home"
path = "/a/./b/../../c/", => "/c"
=end

def simplify(path_str)
  path = path_str.split("/")
  stack = []
  for i in 0...path.length
    case path[i]
    when ".", "" # ignore
    when ".."
      stack.pop unless stack.empty?
    else
      # some folder name
      stack.push path[i]
    end
  end

  "/" + stack.join("/")
end

puts simplify("/hithere/../")
