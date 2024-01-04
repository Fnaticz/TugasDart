import 'dart:io';

class komponen {

  late String nama;
  late String category;
  late int harga;
  late int stok;

  komponen(this.nama, this.category, this.harga, this.stok);

}

void main() {

  List<komponen> komponens = [

    komponen('Processor', 'CPU', 300000, 10),
    komponen('Memory', 'RAM', 80000, 20),
    komponen('Storage', 'SSD', 150000, 15),
    komponen('Graphics Card', 'GPU', 500000, 8),

  ];

  List<int> jumlahs = List.filled(komponens.length, 0);

  print('Daftar Part Komputer:');

  for (int i = 0; i < komponens.length; i++) {

    print('${i + 1}. ${komponens[i].nama} \t Kategori: ${komponens[i].category} \t Harga: ${komponens[i].harga} \t Stok: ${komponens[i].stok}');
  
  }

  while (true) {

    stdout.write('Pilih nomor part komputer yang ingin dibeli (0 untuk selesai): ');
    int pilih = int.parse(stdin.readLineSync()!);

    if (pilih == 0) {
      break;

    }

    if (pilih < 1 || pilih > komponens.length) {
      
      print('Pilihan tidak valid. Silakan pilih nomor part komputer yang benar.');
      continue;
    
    }

    stdout.write('Masukkan jumlah yang dibeli: ');
    int jumlah = int.parse(stdin.readLineSync()!);

    if (jumlah > komponens[pilih - 1].stok) {

      print('Stok tidak mencukupi. Hanya tersedia ${komponens[pilih - 1].stok} ${komponens[pilih - 1].nama}.');
      continue;

    }

    jumlahs[pilih - 1] += jumlah;
    komponens[pilih - 1].stok -= jumlah;
  }

  double total = calculateTotal(komponens, jumlahs);

  print('\nDetail Pembelian:');

  for (int i = 0; i < komponens.length; i++) {
  
    if (jumlahs[i] > 0) {
  
      print('${komponens[i].nama} \t Kategori: ${komponens[i].category} \t Harga: ${komponens[i].harga} \t Jumlah: ${jumlahs[i]}');
      print('Stok tersisa: ${komponens[i].stok}');
  
    }
  
  }

  print('\nTotal Pembelian: $total');

}

double calculateTotal(List<komponen> komponens, List<int> jumlahs) {

  double total = 0.0;

  for (int i = 0; i < komponens.length; i++) {

    total += komponens[i].harga * jumlahs[i];

  }

  return total;

}
