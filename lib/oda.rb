
class Oda
    attr_accessor :oda_durumu
    attr_reader :id
    
    DOSYA_ADI = './db/oda.txt'
    
		def oda_ekle
			if @id.nil?
				oda_id_ata	
				oda = [@id, @oda_durumu]

				File.open(DOSYA_ADI, 'a') do |dosya|
					dosya.puts oda.join(';')
				end
			else
				oda.list.each do |oda|
					File.open(DOSYA_ADI, "w") do |dosya|
						if ogrenci.id == @id
							dosya.puts [@id, @oda_durumu].join(';')
						else
							dosya.puts [oda.id, oda.oda_durumu].join(';')
						end
					end
				end
			end
		end

    	def oda_sil
			Oda.list.select { |oda| oda.id != @id }.each do |oda|
				File.open(DOSYA_ADI, 'w') do |dosya|
					dosya.puts [oda.id, oda.oda_durumu].join(';')
				end
			end
	    end
   
		def oda_degistir (oda_no,durum)
				_satirlar=[]
			File.open(DOSYA_ADI, 'r')  {|dosya| _satirlar = dosya.readlines }
			File.open(DOSYA_ADI,'w') do |dosya| 
				_odalar=[]
				_satirlar.each do |satir|
					_satir = satir.split(';')
					if _satir[0] == oda_no
						_odalar << "#{_satir[0]};#{durum}"
					else
						_odalar << satir
					end
				
				end
				_odalar.each {|i| dosya.puts i }
			end
			
		
		end
		

		
	
    	private
		def oda_id_ata
			last_user = oda.list.last
			@id = last_user ? last_user.id.next : 1
		end
		
		protected
		def id=(id)
			@id = id
		end
		
	class << self

		def oda_goster (istenen)
			_odalar = []
    			File.open DOSYA_ADI, "r" do |dosya|
        			dosya.readlines.each {|line| _odalar << line.split(';') if line.split(';').last == "#{istenen}\n"}
    			end
    		_odalar		
		end

			
	end
    
end







=begin
    	def giris_yap (oda_no)
    		Oda.list.select 
    	File.open(DOSYA_ADI, 'r') do |temp|
    		
    		
    		
   	oda_durumu = 1 if oda_no == 
    		
    	
    	end

     DOLU ODALARI LİSTELEYECEK METHOD
        def dolu_odalar
            odalar=[]
            File.open(oda.txt, 'r') do |oda|
                oda.each (|oda| odalar << oda if oda[i][4]==1)
            end
        end
=end     