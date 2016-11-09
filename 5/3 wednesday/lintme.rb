work = ["work"]

def do_stuff(stuff_to_do)
  stuff_to_do.each do |msg|
    puts "Doing the work for #{msg}"
end
end

do_stuff work
