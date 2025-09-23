import 'dart:io';

void main() {
  stdout.write("Masukkan Skor Anda:");
  String? input = stdin.readLineSync(); //Baris kode untuk memasukkan inputan
  int? skor = int.tryParse(
    input ?? ' ',
  ); // Baris kode untuk mengubah inputan menjadi integer
  if (skor == null || skor < 0 || skor > 100) {
    // Validasi Input sebelum Masuk ke pengecekan nilai
    print("Input tidak Valid");
    return;
  }
  print("Skor Anda: $skor");
  if (skor >= 85) {
    //Pengecekan nilai dari untuk menentukan grade
    print("Grade Anda: A");
  } else if (skor >= 70) {
    print("Grade Anda: B");
  } else if (skor >= 60) {
    print("Grade Anda: C");
  } else if (skor >= 50) {
    print("Grade Anda: D");
  } else {
    print("Grade Anda: E");
  }
}
