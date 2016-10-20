def keyword_args(speak:)  # ~> ArgumentError: unknown keyword: other_unexpected_key
  "hi class" if speak     # => "hi class"
end                       # => :keyword_args

def old_style_keyword_args(args = {})
  args[:speak] ||= false  # => false, true


  "hi class" if args[:speak]  # => nil, "hi class"
end                           # => :old_style_keyword_args


old_style_keyword_args(other_unexpected_key: "lol")               # => nil
old_style_keyword_args(speak: true, other_unexpected_key: "lol")  # => "hi class"

keyword_args(speak: true)                               # => "hi class"
keyword_args(speak: true, other_unexpected_key: "lol")

# ~> ArgumentError
# ~> unknown keyword: other_unexpected_key
# ~>
# ~> /Users/rposborne/Desktop/class/2/4 thursday/keyword_args.rb:1:in `keyword_args'
# ~> /Users/rposborne/Desktop/class/2/4 thursday/keyword_args.rb:17:in `<main>'
