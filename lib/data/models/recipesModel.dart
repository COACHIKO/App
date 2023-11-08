import 'package:hive/hive.dart';

class recipeDataModel {
  final String? recipeName;
  final String? recipSteps;
  final List ingredients;
  final String? image;
  bool? isSelected;
  recipeDataModel({this.recipeName,this.recipSteps,required this.ingredients,this.image,this.isSelected});
}
class RecipeDataModelAdapter extends TypeAdapter<recipeDataModel> {
  @override
  final int typeId = 1; // Unique ID for your custom class

  @override
  recipeDataModel read(BinaryReader reader) {
    return recipeDataModel(
      recipeName: reader.readString(),
      recipSteps: reader.readString(),
      ingredients: reader.readList().cast<dynamic>(), // Read nullable list and cast it
      image: reader.readString(),
      isSelected: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, recipeDataModel obj) {
    writer.writeString(obj.recipeName ?? ''); // Handle nullable string
    writer.writeString(obj.recipSteps ?? ''); // Handle nullable string
    writer.writeList(obj.ingredients); // Write list (can be null)
    writer.writeString(obj.image ?? ''); // Handle nullable string
    writer.writeBool(obj.isSelected ?? false); // Handle nullable bool (default to false if null)
  }
}

