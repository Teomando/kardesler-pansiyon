require "./lib/oda"

oda = Oda.new
oda.id = 101
oda.oda_durumu = 1

oda.save()

puts "Oda No: #{oda.id} ile kaydedildi."
puts "Oda durumu #{oda.oda_durumu}"
