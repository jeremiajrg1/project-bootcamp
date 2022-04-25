class ListTambahDokumen {
  int? id;
  String? nama_dokumen;
  String? no_dokumen;
  String? foto;

  ListTambahDokumen(
      {this.id,
        this.nama_dokumen,
        this.no_dokumen,
        this.foto});

  ListTambahDokumen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama_dokumen = json['nama_dokumen'];
    no_dokumen = json['no_dokumen'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_dokumen'] = nama_dokumen;
    data['no_dokumen'] = no_dokumen;
    data['foto'] = foto;
    return data;
  }
}