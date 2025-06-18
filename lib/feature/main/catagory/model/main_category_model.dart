class MainCategoryModel {
  int? parentCategoryId;
  Null parentCategoryCode;
  Null parentCategoryArName;
  Null? parentCategoryEnName;
  int? categoryId;
  String? categoryCode;
  String? categoryArName;
  String? categoryEnName;
  Null? notes;
  bool? addCategoryToClinics;
  bool? addCategoryToRest;
  bool? addCategoryToSalon;
  bool? invisibleCategory;
  bool? stopedCategory;
  bool? clinicCategory;
  String? categoryImage;

  MainCategoryModel(
      {this.parentCategoryId,
        this.parentCategoryCode,
        this.parentCategoryArName,
        this.parentCategoryEnName,
        this.categoryId,
        this.categoryCode,
        this.categoryArName,
        this.categoryEnName,
        this.notes,
        this.addCategoryToClinics,
        this.addCategoryToRest,
        this.addCategoryToSalon,
        this.invisibleCategory,
        this.stopedCategory,
        this.clinicCategory,
        this.categoryImage});

  MainCategoryModel.fromJson(Map<String, dynamic> json) {
    parentCategoryId = json['ParentCategoryId'];
    parentCategoryCode = json['ParentCategoryCode'];
    parentCategoryArName = json['ParentCategoryArName'];
    parentCategoryEnName = json['ParentCategoryEnName'];
    categoryId = json['CategoryId'];
    categoryCode = json['CategoryCode'];
    categoryArName = json['CategoryArName'];
    categoryEnName = json['CategoryEnName'];
    notes = json['Notes'];
    addCategoryToClinics = json['AddCategoryToClinics'];
    addCategoryToRest = json['AddCategoryToRest'];
    addCategoryToSalon = json['AddCategoryToSalon'];
    invisibleCategory = json['InvisibleCategory'];
    stopedCategory = json['StopedCategory'];
    clinicCategory = json['ClinicCategory'];
    categoryImage = json['CategoryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ParentCategoryId'] = this.parentCategoryId;
    data['ParentCategoryCode'] = this.parentCategoryCode;
    data['ParentCategoryArName'] = this.parentCategoryArName;
    data['ParentCategoryEnName'] = this.parentCategoryEnName;
    data['CategoryId'] = this.categoryId;
    data['CategoryCode'] = this.categoryCode;
    data['CategoryArName'] = this.categoryArName;
    data['CategoryEnName'] = categoryEnName;
    data['Notes'] = notes;
    data['AddCategoryToClinics'] = this.addCategoryToClinics;
    data['AddCategoryToRest'] = this.addCategoryToRest;
    data['AddCategoryToSalon'] = this.addCategoryToSalon;
    data['InvisibleCategory'] = this.invisibleCategory;
    data['StopedCategory'] = this.stopedCategory;
    data['ClinicCategory'] = this.clinicCategory;
    data['CategoryImage'] = this.categoryImage;
    return data;
  }
}