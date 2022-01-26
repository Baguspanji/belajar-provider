class BarangModel {
  String? idBarang;
  String? idKategori;
  String? nama;
  String? stok;
  String? harga;
  String? tanggal;
  String? createDate;
  String? namaKategori;

  BarangModel(
      {this.idBarang,
      this.idKategori,
      this.nama,
      this.stok,
      this.harga,
      this.tanggal,
      this.createDate,
      this.namaKategori});

  BarangModel.fromJson(Map<String, dynamic> json) {
    idBarang = json['id_barang'];
    idKategori = json['id_kategori'];
    nama = json['nama'];
    stok = json['stok'];
    harga = json['harga'];
    tanggal = json['tanggal'];
    createDate = json['create_date'];
    namaKategori = json['nama_kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_barang'] = this.idBarang;
    data['id_kategori'] = this.idKategori;
    data['nama'] = this.nama;
    data['stok'] = this.stok;
    data['harga'] = this.harga;
    data['tanggal'] = this.tanggal;
    data['create_date'] = this.createDate;
    data['nama_kategori'] = this.namaKategori;
    return data;
  }
}
