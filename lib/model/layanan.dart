import 'package:smartlink/util/safe.utils.dart';

class Layanan {
  String idlayanan;
  String namaLayanan;
  int jumlah;
  double durasiPenyelesaian;
  int idsatuan;
  double harga;
  bool hapus;
  String namaSatuan;
  String createdAt;
  String updatedAt;

  Layanan({
    this.idlayanan,
    this.namaLayanan,
    this.jumlah,
    this.durasiPenyelesaian,
    this.idsatuan,
    this.harga,
    this.hapus,
    this.namaSatuan,
    this.createdAt,
    this.updatedAt,
  });

  Layanan.fromJson(Map<String, dynamic> json) {
    idlayanan = json['idlayanan'];
    namaLayanan = json['nama_layanan'];
    jumlah = json['jumlah'];
    durasiPenyelesaian = SafeUtils.parseDouble(json, 'durasi_penyelesaian');
    idsatuan = json['idsatuan'];
    harga = SafeUtils.parseDouble(json, 'harga');
    hapus = SafeUtils.parseBool(json, 'harga');
    namaSatuan = json['nama_satuan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idlayanan'] = this.idlayanan;
    data['nama_layanan'] = this.namaLayanan;
    data['jumlah'] = this.jumlah;
    data['durasi_penyelesaian'] = this.durasiPenyelesaian;
    data['idsatuan'] = this.idsatuan;
    data['harga'] = this.harga;
    data['hapus'] = this.hapus;
    data['nama_satuan'] = this.namaSatuan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
