class ServiceModel {
  String idlayanan;
  String namaLayanan;
  int jumlah;
  int durasiPenyelesaian;
  int idsatuan;
  int harga;
  int hapus;
  String namaSatuan;
  String createdAt;
  String updatedAt;

  ServiceModel(
      {this.idlayanan,
      this.namaLayanan,
      this.jumlah,
      this.durasiPenyelesaian,
      this.idsatuan,
      this.harga,
      this.hapus,
      this.namaSatuan,
      this.createdAt,
      this.updatedAt});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    idlayanan = json['idlayanan'];
    namaLayanan = json['nama_layanan'];
    jumlah = json['jumlah'];
    durasiPenyelesaian = json['durasi_penyelesaian'];
    idsatuan = json['idsatuan'];
    harga = json['harga'];
    hapus = json['hapus'];
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
