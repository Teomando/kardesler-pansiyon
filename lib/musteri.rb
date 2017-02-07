class Musteri

  attr_accessor :id, :adi_soyadi, :oda_no, :giris_tarihi, :cikis_tarihi

  DATABASE_FILE = "./db/musteri.txt"

  def give_id
    File.open DATABASE_FILE, "r" do |dosya|
      id = 1
      dosya.readlines.map { |line| id = line.split(';').first.to_i + 1 if line.split(';').first.to_i >= id }
      id
    end
  end

  def giris_yap ad_soyad, oda_no
    File.open DATABASE_FILE, "a" do |dosya|
      dosya.puts [give_id, ad_soyad, oda_no, Time.now, ''].join(';')
    end
  end

  def cikis_yap
    aktif_musteri = Musteri.aktif_musteri_bul @id
    unless aktif_musteri.nil?
      musteriler = Musteri.tum_musteriler
      _musteriler = []
      musteriler.each do |musteri|
        if musteri[0].to_i == @id
          _musteriler << [musteri[0], musteri[1], musteri[2], musteri[3], Time.now]
        else
          _musteriler << musteri
        end
      end
      Musteri.dosyaya_kaydet _musteriler
    end
    aktif_musteri
  end

  class << self

    def tum_musteriler
      musteriler = []
      File.open DATABASE_FILE, "r" do |dosya|
        dosya.readlines.each { |line| musteriler << line.split(';') }
      end
      musteriler
    end

    def aktif_musteriler
      musteriler = []
      File.open DATABASE_FILE, "r" do |dosya|
        dosya.readlines.each { |line| musteriler << line.split(';') if line.split(';').last == "\n" }
      end
      musteriler
    end

    def pasif_musteriler
      musteriler = []
      File.open DATABASE_FILE, "r" do |dosya|
        dosya.readlines.each { |line| musteriler << line.split(';') if line.split(';').last != "\n" }
      end
      musteriler
    end

    def aktif_musteri_bul id
      arr = aktif_musteriler .select { |musteri| musteri[0].to_i == id }.first
      musteri = self.new
      unless arr.nil?
        musteri.id = arr[0].to_i
        musteri.adi_soyadi = arr[1]
        musteri.oda_no = arr[2]
        musteri.giris_tarihi = Time.new arr[3]
        musteri.cikis_tarihi = Time.new arr[4]
      end
      musteri
    end

    def dosyaya_kaydet musteriler
      File.open DATABASE_FILE, "w" do |dosya|
        musteriler.each { |musteri| dosya.puts musteri.join(';') }
      end
    end

  end

end