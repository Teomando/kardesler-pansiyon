require "./lib/musteri"
require "./lib/oda"
# m = Musteri.new
 #m.giris_yap "Aykut YILDIRIM", "101"

# m= Musteri.aktif_musteri_bul 1
# m.cikis_yap

#o=Oda.new
#o.oda_degistir("105","0")
    Musteri.aktif_musteriler.each {|i| puts "#{i[0]})Adı Soyadı :#{i[1]}\n Oda Numarası : #{i[2]}\n Giris Tarihi : #{i[3]}\n" }
    #p Oda.oda_goster("0")
    
    
    
    puts"SElam"