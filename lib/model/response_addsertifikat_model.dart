class ListTambahSertif {
  int? id;
  String? nama_sertif;
  String? no_sertif;
  String? tanggal_berlaku;
  String? tanggal_berakhir;
  String? foto;

  ListTambahSertif(
      {this.id,
        this.nama_sertif,
        this.no_sertif,
        this.tanggal_berlaku,
        this.tanggal_berakhir,
        this.foto});

  ListTambahSertif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_sertif = json['nama_sertif'];
    no_sertif = json['no_sertif'];
    tanggal_berlaku = json['tanggal_berlaku'];
    tanggal_berakhir = json['tanggal_berakhir'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_sertif'] = nama_sertif;
    data['no_sertif'] = no_sertif;
    data['tanggal_berlaku'] = tanggal_berlaku;
    data['tanggal_berakhir'] = tanggal_berakhir;
    data['foto'] = foto;
    return data;
  }
}