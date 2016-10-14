require_relative "./bottle"


# Should be created with an optional prefilled volume
allies_bottle = Bottle.new
coke_bottle = Bottle.new(200)

allies_bottle.open! if allies_bottle.closed?
allies_bottle.fill_up(200)

allies_bottle.take_a_sip
allies_bottle.volume
allies_bottle.close!

puts allies_bottle.🍾


# Lets have this blow up
allies_bottle.take_a_sip
