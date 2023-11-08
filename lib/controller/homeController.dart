import 'dart:core';
 import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/models/recipesModel.dart';
import 'onboardingController.dart';

class HomeController extends onBoardingController  {
 final onboardingController = Get.put<onBoardingController>(onBoardingController());

  void printOnboardingVariable() {
onboardingController.foodContent.forEach((element) {
   (ingredientsToSearch.add(element.foodName.toString()));
});

  }


  List <recipeDataModel> Recipes = [

    recipeDataModel(recipeName: "Chicken With Rice",
        ingredients: ["chbreastraw".tr, "whitericeraw".tr,],
        recipSteps: "sss",
        image: "assets/p.png",
        isSelected: false),

    recipeDataModel(recipeName: "Chicken",
        ingredients: ["chbreastraw".tr,],
        recipSteps: "aa",
        image: "assets/p.png",
        isSelected: false),
    recipeDataModel(recipeName: "Chicken",
        ingredients: ["btaw".tr,],
        recipSteps: "aa",
        image: "assets/p.png",
        isSelected: false),

  ];

  List<String> availableChoices = [];
  List<String> ingredientsToSearch=[];
  List <recipeDataModel> recipeFilterd = [];
String ingredients="";


  checkRecipeIngredients() {
    printOnboardingVariable();

    bool allIngredientsExistInRecipe(recipeDataModel recipe) {
      return recipe.ingredients.every((ingredient) =>
          ingredientsToSearch.contains(ingredient));
    }

    for (var recipe in Recipes) {
      if (allIngredientsExistInRecipe(recipe)) {
        //print("All ingredients for ${recipe.recipeName} are available.");
        recipeFilterd.add(recipe);
       /// print(recipeFilterd);
      } else {
       // print("Not all ingredients for ${recipe.recipeName} are available.");
      }
    }


    update();
  }


  }

















/// give me all the probabilities of Recipes can be used if all its ingredients exists in ingredientsToSearch and add it to recipeFilterd
/// List <recipeDataModel> Recipes = [
//
//     recipeDataModel(recipeName: "Chicken With Rice",
//         ingredients: ["Chicken Breast Raw", "Rice",],
//         recipSteps: "sss",
//         image: "assets/p.png",
//         isSelected: false),
//
//     recipeDataModel(recipeName: "Chicken",
//         ingredients: ["Chicken Breast Raw",],
//         recipSteps: "aa",
//         image: "assets/p.png",
//         isSelected: false),
//
//   ];
/// List <recipeDataModel> recipeFilterd = [];
//   List <String> ingredientsToSearch = [];
///
///
///