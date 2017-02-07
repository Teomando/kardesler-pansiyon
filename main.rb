require "./lib/musteri"
require "./lib/oda"
require "date"

def menu_goster
  puts "****************************"
  puts "Kardeşler Pansiyona Hoşgeldiniz!"
  puts "Müşteri girişi için 1'i ;"
  puts "Müşteri çıkışı için 2'yi ;"
  puts "Dolu odaları görmek için 3'ü ;"
  puts "Boş odaları görmek için 4'ü ;"
  puts "Müşteri listesini görmek için 5'i ;"
  puts "Geçmiş müşteri listesini görmek için 6'yı ;"
  puts "Hangi odada kimin kaldığını görmek için 7'yi ;"
  puts "Çıkış yapmak için 0'ı tuşlayınız"
  puts "****************************"
end


oda=Oda.new
musteri=Musteri.new
loop do
  menu_goster
  secim = gets.chomp
  case secim

    when "1"
      puts "Ad Soyad giriniz : "
      ad_soyad = gets.chomp.to_s
      puts "Oda numarası giriniz : "
      oda_no = gets.chomp.to_s

      musteri.giris_yap(ad_soyad, oda_no)
      oda.oda_degistir(oda_no, "1")


    when "2"
      Musteri.aktif_musteriler.each { |i| puts "#{i[0]})Adı Soyadı :#{i[1]}\n Oda Numarası : #{i[2]}\n Giris Tarihi : #{i[3]}\n" }
      puts "ID giriniz: "
      musteri_id = gets.chomp.to_i
      m = Musteri.aktif_musteri_bul(musteri_id)
      m.cikis_yap
      oda.oda_degistir(m.oda_no, "0")
      gun_sayisi = ((Time.now - DateTime.strptime(m.giris_tarihi, '%Y-%m-%d %H:%M:%S %z').to_time)/86400).ceil
      print "Ödemeniz gereken tutar :"

      puts "#{20*gun_sayisi} TL'dir."

    when "3"
      puts "Dolu odalar :"
      Oda.oda_goster("1").each { |i| puts "#{i[0]}\n" }

    when "4"
      puts "Bos odalar :"
      Oda.oda_goster("0").each { |i| puts "#{i[0]}\n" }

    when "5"
      puts Musteri.aktif_musteriler

    when "6"
      puts Musteri.pasif_musteriler

    when "7"
        puts"Oda numarası giriniz :"
        oda_no = gets.chomp
        puts Musteri.oda_bul(oda_no)[1]
        
    when "0"
      break
  end

end