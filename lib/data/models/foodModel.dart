import 'package:hive/hive.dart';

class foodDataModel {
  final String? foodName;
 // final String? iconImage;
//  final String? foodImage;
  final double? calories;
  final double? protein;
  final double? carbohydrate;
  final double? fat;
  bool? isSelected;
  bool? isFirstClick;

  foodDataModel({this.foodName,this.calories,this.protein, this.carbohydrate, this.fat, this.isSelected,this.isFirstClick});
}
class FoodDataModelAdapter extends TypeAdapter<foodDataModel> {
  @override
  final int typeId = 0; // You can use any unique positive integer here

  @override
  foodDataModel read(BinaryReader reader) {
    return foodDataModel(
      foodName: reader.read(),
    //  iconImage: reader.read(),
    //  foodImage: reader.read(),
      calories: reader.read(),
      protein: reader.read(),
      carbohydrate: reader.read(),
      fat: reader.read(),
      isSelected: reader.read(),
      isFirstClick: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, foodDataModel obj) {
    writer.write(obj.foodName);
   // writer.write(obj.iconImage);
   // writer.write(obj.foodImage);
    writer.write(obj.calories);
    writer.write(obj.protein);
    writer.write(obj.carbohydrate);
    writer.write(obj.fat);
    writer.write(obj.isSelected);
    writer.write(obj.isFirstClick);
  }
}
