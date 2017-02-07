require "./lib/musteri"
require "./lib/oda"

require "date"
# m = Musteri.new
# m.giris_yap "Aykut YILDIRIM", "101"

# m= Musteri.aktif_musteri_bul 1
# m.cikis_yap

#o=Oda.new
#o.oda_degistir("105","0")


# p Musteri.aktif_musteri_bul 1

giris = "2017-02-07 10:57:36 +0300"

t = Time.now - DateTime.strptime(giris, '%Y-%m-%d %H:%M:%S %z').to_time
p (t / 86400).ceil