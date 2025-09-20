void main() {
  String namaKaryawan = "Kanda Karca";
  int jam_kerja = 35;
  double upah_per_jam = 50000;
  bool statusKaryawan = true;
  double gajiKotor = jam_kerja * upah_per_jam;
  statusKaryawan = true;

  print("Slip gaji\n---------------------------------------------");
  print("Nama Karyawan : $namaKaryawan");
  print("Gaji Kotor : $gajiKotor");
  if (statusKaryawan == false) {
    print("Pajak : 0");
  } else
    print("Pajak : ${gajiKotor * 0.1}");
  print("Gaji Bersih : ${gajiKotor - (gajiKotor * 0.1)}");
}
