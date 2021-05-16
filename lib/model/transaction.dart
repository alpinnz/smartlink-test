class Transaction {
  String id;
  String total;
  String keteragan;
  String tanggalBuat;
  String tanggalSelesai;

  Transaction({
    this.id,
    this.total,
    this.keteragan,
    this.tanggalBuat,
    this.tanggalSelesai,
  });

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    keteragan = json['keteragan'];
    tanggalBuat = json['tanggal_buat'];
    tanggalSelesai = json['tanggal_selesai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['keteragan'] = this.keteragan;
    data['tanggal_buat'] = this.tanggalBuat;
    data['tanggal_selesai'] = this.tanggalSelesai;
    return data;
  }
}
