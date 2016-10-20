1.methods
1.methods(:inspect)
def annoucer
  `say Hello`
end
method(:annoucer)
def caller(code)
  code.call
end
caller(method(:annoucer))
:annoucer.call
method(:annoucer)
methods
method(:annoucer)
method(:annoucer).call
methods
method(:method)
method(:nil?)
method(:nil?).call
method(:nil?).methods
ls method(:nil?)
method(:nil?).source
method(:nil?).source_location
method(:annoucer).source_location
method(:annoucer).source
reuire 'ffaker'
require 'ffaker'
FFaker::SSN
ls FFaker::SSN
FFaker::SSN.ssn
FFaker::SSN.method(:ssn)
FFaker::SSN.method(:ssn).source
FFaker::SSN.method(:ssn).source_location
exit
"123".length
exit
require './our_enumerable'
our_map(["hi", "moooooose"]) { |el| el.length }
require './our_enumerable'
exit
ri Array.select
exit
our_proce = Proc.new {`say hi`}
our_proce.call
method(:nil?)
exit
block
block.call
exit
block
block.call
exit
block.call
exit
