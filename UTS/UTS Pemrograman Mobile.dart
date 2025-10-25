//abstract class
abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);
  double get tarifDasar => _tarifDasar;

  //metode abstract untuk menghitung tarif
  double hitungTarif(int jumlahPenumpang);

  //metode abstract untuk menampilkan info
  void tampilInfo() {
    print("ID: $id");
    print("Nama: $nama");
    print("Tarif Dasar: $tarifDasar");
    print("Kapasitas: $kapasitas");
  }
}

//Class Taksi, turunan dari class Transportasi
class Taksi extends Transportasi {
  double jarak;

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print("Jarak: $jarak km");
    print("Jenis: Taksi\n");
  }
}

//Class Bus, turunan dari class Transportasi
class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return (tarifDasar * jumlahPenumpang) + (adaWifi ? 5000 : 0);
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print("Ada Wifi: ${adaWifi ? "Ya" : "Tidak"}");
    print("Jenis: Bus\n");
  }
}

//Class Pesawat, turunan dari class Transportasi
class Pesawat extends Transportasi {
  String kelasPenerbangan;
  Pesawat(
    String id,
    String nama,
    double tarifDasar,
    int kapasitas,
    this.kelasPenerbangan,
  ) : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar *
        jumlahPenumpang *
        (kelasPenerbangan == "Bisnis" ? 1.5 : 1.0);
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print("Kelas Penerbangan: $kelasPenerbangan");
    print("Jenis: Pesawat\n");
  }
}

//class Pemesanan
class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan(
    this.idPemesanan,
    this.namaPelanggan,
    this.transportasi,
    this.jumlahPenumpang,
    this.totalTarif,
  );

  //fungsi untuk menampilkan struk pemesanan
  void cetakStruk() {
    print("===============================");
    print("ID Pemesanan: $idPemesanan");
    print("Nama Pelanggan: $namaPelanggan");
    print("Transportasi: ${transportasi.nama}");
    print("Jumlah Penumpang: $jumlahPenumpang");
    print("Total Tarif: $totalTarif");
    print("===============================");
  }

  //Map untuk simulasi database
  Map<String, dynamic> toMap() {
    return {
      "idPemesanan": idPemesanan,
      "namaPelanggan": namaPelanggan,
      "transportasi": transportasi.nama,
      "jumlahPenumpang": jumlahPenumpang,
      "totalTarif": totalTarif,
    };
  }
}

//Fungsi Global
//fungsi untuk membuat pemesanan
Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  double total = t.hitungTarif(jumlahPenumpang);
  String id = 'P${DateTime.now().millisecondsSinceEpoch}';
  return Pemesanan(id, nama, t, jumlahPenumpang, total);
}

//fungsi untuk menampilkan semua pemesanan
void tampilSemuapemesanan(List<Pemesanan> daftar) {
  for (var p in daftar) {
    p.cetakStruk();
  }
}

void main() {
  //objek dari turunan class Transportasi
  Taksi taksi = Taksi("T001", "Taksi Jakarta", 3000, 4, 10);
  Bus bus = Bus("B001", "Bus Bandung", 5000, 40, true);
  Pesawat pesawat = Pesawat("P001", "Pesawat Surabaya", 100000, 180, "Bisnis");

  //menampilkan info transportasi
  print("=== Info Transportasi ===");
  taksi.tampilInfo();
  bus.tampilInfo();
  pesawat.tampilInfo();

  //list untuk membuat daftar pemesanan
  var daftarPemesanan = <Pemesanan>[];
  daftarPemesanan.add(buatPemesanan(taksi, "nabil", 2));
  daftarPemesanan.add(buatPemesanan(bus, "rina", 5));
  daftarPemesanan.add(buatPemesanan(pesawat, "andi", 1));

  tampilSemuapemesanan(daftarPemesanan);
}
