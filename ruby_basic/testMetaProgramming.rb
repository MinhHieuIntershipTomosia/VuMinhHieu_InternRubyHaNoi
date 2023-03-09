class Sach
  attr_accessor :tac_gia, :ten_sach

  def initialize(ten_sach, tac_gia)
    @ten_sach = ten_sach
    @tac_gia = tac_gia
  end
end

class TacGia
  attr_accessor :ten, :sachs

  def initialize(ten)
    @ten = ten
    @sachs = []
  end

  def sach_cua_tac_gia
    self.sachs.map(&:ten_sach)
  end

  def self.hien_thi_tac_gia_va_sach(tac_gias)
    tac_gias.each do |tac_gia|
      puts "Tác giả: #{tac_gia.ten}"
      puts "Sách của tác giả: #{tac_gia.sach_cua_tac_gia.join(", ")}"
    end
  end
end

tac_gia1 = TacGia.new("Nguyen Nhat Anh")
tac_gia2 = TacGia.new("To Hoai")

sach1 = Sach.new("Cho toi xin mot ve di tuoi tho", tac_gia1)
sach2 = Sach.new("Toi thay hoa vang tren co xanh", tac_gia2)
sach3 = Sach.new("Kinh van hoa", tac_gia1)

tac_gia1.sachs << sach1
tac_gia1.sachs << sach3
tac_gia2.sachs << sach2

TacGia.hien_thi_tac_gia_va_sach([tac_gia1, tac_gia2])
