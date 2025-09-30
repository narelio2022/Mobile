import 'dart:io';

void main() {
  // Data list yang bertipe lis untuk menyimpan menu dan harga
  List<List<dynamic>> menu = [
    ['Ayam Bakar + Nasi', 20000],
    ['Nasi Goreng', 20000],
    ['Mie Ayam', 15000],
    ['Es Jeruk', 7000],
    ['Es Teh', 5000],
    ['Coca cola', 5000],
  ];

  //list untuk menyimpan pilihan menu
  List<List<dynamic>> pilihan_menu = [];

  //variabel untuk menyimpan total harga
  num total_Harga = 0;

  //tampilan utama saat program dijalankan
  print("Selamat Datang di Restoran INFORMATIKA");

  //validasi inputan dari pengguna, jika inputan tidak sesuai pengguna akan diminta untuk input ulang
  while (true) {
    String? pilihan;
    while (pilihan != '1' && pilihan != '2') {
      stdout.write("Masukkan No 1 untuk Makanan, 2 untuk Minuman:");
      pilihan = stdin.readLineSync();
      if (pilihan != '1' && pilihan != '2') {
        print("Pilihan tidak valid. Silakan coba lagi.");
      }
    }

    //switch case untuk menampilkan menu makanan atau minuman sesuai pilihan pengguna
    switch (pilihan) {
      case '1':
        print("Daftar Makanan:");
        for (var i = 0; i < menu.length - 3; i++) {
          print("${i + 1}. ${menu[i][0]} - Rp${menu[i][1]}");
        }
        break;

      case '2':
        print("Daftar Minuman:");
        for (var i = 3; i < menu.length; i++) {
          print("${i - 2}. ${menu[i][0]} - Rp${menu[i][1]}");
        }
        break;
    }

    //variabel untuk menyimpan pilihan menu dari pengguna
    String pilih_Menu = "0";

    /*validasi inputan dari pengguna, jika inputan tidak sesuai pengguna akan diminta untuk input ulang, 
    jika inputan sesuai maka menu akan ditambahkan ke list pilihan_menu*/
    while (int.parse(pilih_Menu) > 3 || int.parse(pilih_Menu) < 1) {
      stdout.write("Masukkan Menu yang dipilih (1-3) :");
      pilih_Menu = stdin.readLineSync()!;
      if (pilihan == '1') {
        if (pilih_Menu == '1') {
          pilihan_menu.add(menu[0]);
          print("\x1B[2J\x1B[0;0H");
          print("Menu Berhasil Ditambahkan");
          break;
        } else if (pilih_Menu == '2') {
          pilihan_menu.add(menu[2]);
          print("\x1B[2J\x1B[0;0H");
          print("Menu Berhasil Ditambahkan");
          break;
        } else if (pilih_Menu == '3') {
          pilihan_menu.add(menu[1]);
          print("\x1B[2J\x1B[0;0H");
          print("Menu Berhasil Ditambahkan");
          break;
        } else {
          print("\x1B[2J\x1B[0;0H");
          print("Pilihan tidak valid. Silakan coba lagi.");
        }
      }
      if (pilihan == '2') {
        if (pilih_Menu == '1') {
          pilihan_menu.add(menu[3]);
          print("\x1B[2J\x1B[0;0H");
          print("Menu Berhasil Ditambahkan");
          break;
        } else if (pilih_Menu == '2') {
          pilihan_menu.add(menu[4]);
          print("\x1B[2J\x1B[0;0H");
          print("Menu Berhasil Ditambahkan");
          break;
        } else if (pilih_Menu == '3') {
          pilihan_menu.add(menu[5]);
          print("\x1B[2J\x1B[0;0H");
          print("Menu Berhasil Ditambahkan");
          break;
        } else {
          print("\x1B[2J\x1B[0;0H");
          print("Pilihan tidak valid. Silakan coba lagi.");
        }
      }
    }

    //Perulangan untuk menampilkan menu yang dipilih
    print("Menu yang dipilih:");
    for (var item in pilihan_menu) {
      print("${item[0]} - Rp${item[1]}");
    }

    //validas intuk mengecek apakah pengguna ingin memesan lagi atau tidak
    String? input;
    while (true) {
      stdout.write("Apakah Anda ingin memesan lagi? (y/n): ");
      input = stdin.readLineSync();

      // Jika pengguna memilih y maka program akan mengulang kembali agar pengguna dapat memilih menu lagi
      if (input == 'y') {
        print("\x1B[2J\x1B[0;0H");
        break;
      }

      //Jike pengguna memilih n maka program akan menampilkan rincian pesanan dan total harga
      if (input == 'n') {
        print("\x1B[2J\x1B[0;0H"); //baris kode untuk membersihkan terminal
        print("rincian pesanan\n---------------------------------");
        for (var item in pilihan_menu) {
          print("${item[0]} - Rp ${item[1]}");
          total_Harga += item[1];
        }
        print("Total Item: ${pilihan_menu.length}");
        print("Total Harga: Rp $total_Harga");
        print("---------------------------------");
        print("Terima kasih telah berkunjung!");
        return;

        //jika inputan tidak sesuai maka pengguna akan diminta untuk input ulang
      } else {
        print("\x1B[2J\x1B[0;0H");
        print("Pilihan tidak valid. Silakan coba lagi.");
      }
    }
  }
}
