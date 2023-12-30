class FavoritesModel {
  List<FavoriteData> data;

  FavoritesModel({required this.data});

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      data: List<FavoriteData>.from(json['Data'].map((favoriteData) => FavoriteData.fromJson(favoriteData))),
    );
  }
}

class FavoriteData {
  int id;
  int user_id;
  int medicine_id;
  String medicineTradeName;
  String medicineScientificName;

  FavoriteData({
    required this.id,
    required this.user_id,
    required this.medicine_id,
    required this.medicineTradeName,
    required this.medicineScientificName,
  });

  factory FavoriteData.fromJson(Map<String, dynamic> json) {
    return FavoriteData(
      id: json['id'],
      user_id: json['user_id'],
      medicine_id: json['medicine_id'],
      medicineTradeName: json['medicineTradeName'],
      medicineScientificName: json['medicineScientificName'],
    );
  }
}
