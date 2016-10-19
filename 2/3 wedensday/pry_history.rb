require 'ffaker'
100.times.map { FFaker::DizzleIpsum.phrase }
q
exit
require 'ffaker'
ls FFaker::DizzleIpsum
FFaker::DizzleIpsum.paragraphs
FFaker::DizzleIpsum.paragraphs.first
FFaker::DizzleIpsum.paragraphs.join ""
FFaker::DizzleIpsum.paragraphs.join "\n"
"192.169.1.16"
pry Array.*
ri Array.*
exit
messages_about_keywords
messages_about_keywords.size
messages_about_keywords
"one two three one".match(/one/)
"one two three one".scan(/one/)
"one two three one".sub(/one/, 1)
"one two three one".sub(/one/, "1")
"one two three one".gsub(/one/, "1")
exit
