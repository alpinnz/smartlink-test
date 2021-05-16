import 'package:smartlink/model/layanan.dart';

class Cart {
  String id;
  String idLayanan;
  String idTransaksi;
  String namaLayanan;
  int jumlahPembelian;
  double hargaLayanan;
  double hargaTotal;
  Layanan layanan;

  Cart({
    this.id,
    this.idLayanan,
    this.idTransaksi,
    this.namaLayanan,
    this.jumlahPembelian,
    this.hargaLayanan,
    this.hargaTotal,
    this.layanan,
  });

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idLayanan = json['idLayanan'];
    idTransaksi = json['idTransaksi'];
    namaLayanan = json['nama_layanan'];
    jumlahPembelian = json['jumlah_pembelian'];
    hargaLayanan = json['harga_layanan'];
    hargaTotal = json['harga_total'];
    layanan = json['layanan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idLayanan'] = this.idLayanan;
    data['idTransaksi'] = this.idTransaksi;
    data['nama_layanan'] = this.namaLayanan;
    data['jumlah_pembelian'] = this.jumlahPembelian;
    data['harga_layanan'] = this.hargaLayanan;
    data['harga_total'] = this.hargaTotal;
    data['layanan'] = this.layanan;
    return data;
  }
}
