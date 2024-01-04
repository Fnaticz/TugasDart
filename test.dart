import 'dart:io';

class StokBarang {
  Map<String, int> stok = {};

  // Membaca stok barang dari txt
  void bacaStok(String pathBerkas) {
    try {
      File berkas = File(pathBerkas);
      String isi = berkas.readAsStringSync();
      
      List<String> baris = isi.split('\n');
      for (String dataBarang in baris) {
        List<String> data = dataBarang.split(':');
        if (data.length == 2) {

          stok[data[0]] = int.parse(data[1]);
       
        }
      }
      
      print('Stok Barang:\n$stok');
    } catch (e) {
      
      print('Kesalahan membaca stok barang: $e');

    }
  }

  // Function tulis stok
  void tulisStok(String pathBerkas) {
    try {
      File berkas = File(pathBerkas);

      StringBuffer buffer = StringBuffer();
      stok.forEach((namaBarang, jumlah) {
        buffer.write('$namaBarang:$jumlah\n');
      });

      berkas.writeAsStringSync(buffer.toString());
      print('Stok barang ditulis dengan sukses');
      
    } catch (e) {
      print('Kesalahan menulis stok barang: $e');
    }
  }

  // Function buat tambah dan kurang
  void perbaruiStok(String namaBarang, int jumlah) {
    if (stok.containsKey(namaBarang)) {
      stok[namaBarang] = jumlah;
    } else {
      stok[namaBarang] = jumlah;
    }
  }
}

void main() {

  String pathBerkasStok = 'stok_barang.txt';
  StokBarang stokBarang = StokBarang();

  // Membaca stok barang
  stokBarang.bacaStok(pathBerkasStok);

  // Menambah atau mengurangi stok barang
  stdout.write("Masukkan nama barang:\n");
  String? name = stdin.readLineSync();

  stdout.write("Perbarui jumlah stok:\n");
  int? stok = int.parse(stdin.readLineSync()!);

  stokBarang.perbaruiStok('$name', stok);

  // Menulis stok barang bisa buat update
  stokBarang.tulisStok(pathBerkasStok);
}
