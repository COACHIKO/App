import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/foodModel.dart';


class onBoardingController extends GetxController {
  ///                                      VARIABLE LAND                                                     ///
  /// Gender Selection
  bool isSelectedMan = false;
  bool isSelectedWoMan = false;
  late bool gender; //true is man //false woman
  /// Goal Selection
  bool isSelectedLoseWheight = false;
  bool isSelectedGainWheight = false;
  bool isSelectedMentainWheight = false;

  /// Activity Selection
  bool isLowActivitySelected = false;
  bool isLightActivitySelected = false;
  bool isModerateActivitySelected = false;
  bool isHeavyActivitySelected = false;
  bool isExtreemActivitySelected = false;
  double activityFactor = 0.0;

  /// Age Calculating
  int age = 0;
  DateTime currentDate = DateTime.now();
   late DateTime birthDate;
    var birth;

  /// TALL AND WEIGHT
  double Weight = 0.0;
  double Tall = 0.0;

  /// BODY MESUREMENT
  int waist = 0;
  int neck = 0;
  int arm = 0;
  int calve = 0;
  int hip = 0;
  int chest = 0;

  ///  BODY COMPOSTION
  double fatpercentage = 0;
  double fatwheight = 0;
  double leanbodymass = 0;

  ///  TARGET GOAL
  late bool wheightloss = isSelectedLoseWheight;

  late bool wheightgain = isSelectedGainWheight;

  late bool wheightmintain = isSelectedMentainWheight;

  /// DIET MONEY FACTOR
  bool Poormoney = false;

  bool Mediummoney = false;

  bool Richmoney = false;

  /// BODY NEEDS
  late double MinProtienValue = leanbodymass * 1;
  double targetProtein = 0;
  double targetCarbs = 0;
  double targetFat = 0;

  double Bmr = 0;
  double Tdee = 0;
  late String ss = Tdee.toString();

  ///BUTTON COUNTER
  int clickTimes = 0;
  bool pathway = true;
  bool pathway2 = false;

  double protienfrompro=0;
  String s="";
  /// Selected FOODS

  ///                                      VARIABLE LAND ENDS HERE                                                     ///

  ///                                      FUNCTION LAND STARTS HERE                                                     ///


  /// SEARCH FUNCTIONS FOR FOODS
  late RxList<foodDataModel> filteredList = <foodDataModel>[].obs;
    List <foodDataModel> namelist = [];


  void filterSearchResults(String query) {
    filteredList.clear();
    update();
    if (query.isNotEmpty) {
      filteredList.addAll(foodContent.where((food) {
        return food.foodName!.toLowerCase().contains(query.toLowerCase());
      }));
      update();
    } else {
      filteredList.addAll(foodContent);
      update();
    }
    update();
  }

  /// BUTTON COLOR CHANGE FUNCTION
  void enableColor(int index) {
    foodContent[index].isSelected = true;
    update();
  }

  void disableColor(int index) {
    foodContent[index].isSelected = false;
    update();
  }

  /// GENDER SELECT
  void womanselected() {
    isSelectedMan = false;
    isSelectedWoMan = true;
    update();
    if (isSelectedMan == false) {
      gender = false;
    }
  }

  void manselected() {
    isSelectedWoMan = false;
    isSelectedMan = true;
    update();
    if (isSelectedMan == true) {
      gender = true;
    }
  }

  /// Goal Selection Function
  void LoseWheightselected() {
    isSelectedLoseWheight = true;
    isSelectedGainWheight = false;
    isSelectedMentainWheight = false;
    update();
  }

  void GainWheightselected() {
    isSelectedGainWheight = true;
    isSelectedLoseWheight = false;
    isSelectedMentainWheight = false;
    update();
  }

  void MintainWheightselected() {
    isSelectedMentainWheight = true;
    isSelectedGainWheight = false;
    isSelectedLoseWheight = false;
    update();
  }

  /// Activity Selection Function
  void isLowActivitySelectedFunction() {
    isLowActivitySelected = true;
    isLightActivitySelected = false;
    isModerateActivitySelected = false;
    isHeavyActivitySelected = false;
    isExtreemActivitySelected = false;
    update();
  }

  void isLightActivitySelectedFunction() {
    isLightActivitySelected = true;
    isModerateActivitySelected = false;
    isHeavyActivitySelected = false;
    isExtreemActivitySelected = false;
    isLowActivitySelected = false;
    update();
  }

  void isModerateActivitySelectedFunction() {
    isModerateActivitySelected = true;
    isHeavyActivitySelected = false;
    isExtreemActivitySelected = false;
    isLowActivitySelected = false;
    isLightActivitySelected = false;
    update();
  }

  void isHeavyActivitySelectedFunction() {
    isHeavyActivitySelected = true;
    isExtreemActivitySelected = false;
    isLowActivitySelected = false;
    isLightActivitySelected = false;
    isModerateActivitySelected = false;
    update();
  }

  void isExtreemActivitySelectedFunction() {
    isExtreemActivitySelected = true;
    isLowActivitySelected = false;
    isLightActivitySelected = false;
    isModerateActivitySelected = false;
    isHeavyActivitySelected = false;
    update();
  }

  void Clasifications() {
    if (isLowActivitySelected == true) {
      activityFactor = 1.200;
    } else if (isLightActivitySelected == true) {
      activityFactor = 1.375;
    } else if (isModerateActivitySelected == true) {
      activityFactor = 1.550;
    } else if (isHeavyActivitySelected == true) {
      activityFactor = 1.725;
    } else if (isExtreemActivitySelected == true) {
      activityFactor = 1.900;
    }
    update();
  }

  /// Age Calculating Function
  void calculateAge() {
    age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

  }

  /// money
  void LowCostDietIsSelected() {
    Poormoney = true;
    Mediummoney = false;
    Richmoney = false;
    update();
  }

  void MediumCostDietIsSelected() {
    Poormoney = false;
    Mediummoney = true;
    Richmoney = false;
    update();
  }

  void HighCostDietIsSelected() {
    Poormoney = false;
    Mediummoney = false;
    Richmoney = true;
    update();
  }

  /// BODY NEEDS CALCULATION FUNCTIONS
  BodyNeeds() {
    FatCalculation() {
      if (gender == true) {
        fatpercentage = 495 /
            (1.0324 -
                .19077 * (log(waist - neck) / log(10)) +
                .15456 * (log(Tall) / log(10))) -
            450;
      } else {
        fatpercentage = 495 /
            (1.29579 -
                .35004 * (log(waist + hip - neck) / log(10)) +
                .22100 * (log(Tall) / log(10))) -
            450;
      }

      fatwheight = (fatpercentage / 100 * Weight);
      leanbodymass = Weight - fatwheight;
      update();
    }


    ProtienCalc() {
      FatCalculation();
      if (fatpercentage > 25 && Poormoney == true && wheightloss == true) {
        targetProtein = leanbodymass * 1.6; // تخين وفقير
      } else
      if (fatpercentage > 25 && Mediummoney == true && wheightloss == true) {
        targetProtein = leanbodymass * 1.8; // تخين وطبقة متوسطة
      } else
      if (fatpercentage > 25 && Richmoney == true && wheightloss == true) {
        targetProtein = leanbodymass * 2; //تخين وغني
      } else
      if (fatpercentage > 25 && Poormoney == true && wheightgain == true ||
          fatpercentage > 25 && Poormoney == true && wheightmintain == true) {
        targetProtein = leanbodymass * 1.6;
      } //تخين وفقير وعايز يتخن تقريبا هيلعب سومو
      else
      if (fatpercentage > 25 && Mediummoney == true && wheightgain == true ||
          fatpercentage > 25 && Mediummoney == true && wheightmintain == true) {
        targetProtein = leanbodymass * 1.8;
      } //تخين و طبقة متوسطة وعايز يتخن تقريبا هيلعب سومو
      else if (fatpercentage > 25 && Richmoney == true && wheightgain == true ||
          fatpercentage > 25 && Richmoney == true && wheightmintain == true) {
        targetProtein = leanbodymass * 2; //تخين و غني وعايز يلعب سومو
      }
// Overwheight Person HaS Done EveryThing
      else if (fatpercentage < 25 && Poormoney == true && wheightloss == true) {
        targetProtein = Weight * 1.8; // جسمه عادي وفقير و عايز يخسر وزن
      } else
      if (fatpercentage < 25 && Mediummoney == true && wheightloss == true) {
        targetProtein =
            Weight * 2.25; // جسمه عادي وعايز يخسر ووزن وطبقة  متوسطة
      } else
      if (fatpercentage < 25 && Richmoney == true && wheightloss == true) {
        targetProtein = Weight * 2.7; //جسمه عاي وغني وعايز يخسر وزن
      } else
      if (fatpercentage < 25 && Poormoney == true && wheightgain == true ||
          fatpercentage < 25 && Poormoney == true && wheightmintain == true) {
        targetProtein = Weight * 1.6; //سمه عادي وووفوقير ووعايز يكسب وزن
      } else
      if (fatpercentage < 25 && Mediummoney == true && wheightgain == true ||
          fatpercentage < 25 && Mediummoney == true && wheightmintain == true) {
        targetProtein = Weight * 1.9; //ججسمه عادي وطبقة متوسطة وعايز يكسب وزن
      } else
      if (fatpercentage < 25 && Richmoney == true && wheightgain == true ||
          fatpercentage < 25 && Richmoney == true && wheightmintain == true) {
        targetProtein =
            Weight * 2.2; //جسمه عادي وعايز يكسب وزن وغني وغالبا دمه تقيل
      }


      update();
    }

    BmrCalculation() {
      ProtienCalc();
      Bmr = 370 + (21.6 * leanbodymass);
      update();
    }

    TdeeCalculation() {
      BmrCalculation();
      Tdee = Bmr * activityFactor;
      update();
      if (isSelectedLoseWheight == true) {
        Tdee = Tdee - 500;
      } else if (isSelectedMentainWheight == true) {
        Tdee = Bmr * activityFactor;
      } else {
        Tdee = Tdee + 200;
      }
      targetCarbs = (Tdee - targetProtein * 4) * .70 / 4;
      targetFat = (Tdee - (targetProtein * 4 + targetCarbs * 4)) / 9;
    }

    FatCalculation();
    ProtienCalc();
    BmrCalculation();
    TdeeCalculation();
    update();
  }


  /// FOODS EVERY INFORMATION
  List<foodDataModel> foodContent = [
    foodDataModel(
      foodName: "chbreastraw".tr,
      calories: 1.2,
      protein: 0.225,
      carbohydrate: 0,
      fat: 0.0262,
      isSelected: false,
      isFirstClick: false,
    ),foodDataModel(
      foodName: "whitericeraw".tr,
      calories: 3.58,
      protein: 0.065,
      carbohydrate: 0.7915,
      fat: 0.0052,
      isSelected: false,
      isFirstClick: false,
    ),foodDataModel(
      foodName: "oliveoil".tr,
      calories: 8.84,
      protein: 0.0,
      carbohydrate: 0,
      fat: 1.0,
      isSelected: false,
      isFirstClick: false,
    ),
  ];



  Map<String, Map<String, double>> NutritionFacts = {

  };







  /// FUNCTION MOVES SELECTED FOODS TO SELECTED
  Map<String, Map<String, double>> getNutritionFacts(foodContent) {
    for (var food in foodContent) {
      if (food.isSelected == true) {
        NutritionFacts[food.foodName!.toLowerCase()] = {
          'calories': food.calories ?? 0.0,
          'protein': food.protein ?? 0.0,
          'carbohydrate': food.carbohydrate ?? 0.0,
          'fat': food.fat ?? 0.0,
        };
      } else if(food.isSelected == false){
        NutritionFacts.remove(food.foodName!.toLowerCase());
        CategorizationFood();
        update();
      }
    }
    CategorizationFood();
    update();
    return NutritionFacts;
  }
  Map<String,double> foodquantities = {};
  Map<String,double> foodquantitiessaver = {};

  Map<String, Map<String, double>> HighProteinFoods = {};
  Map<String, Map<String, double>> HighCarbFoods = {};
  Map<String, Map<String, double>> HighFatFoods = {};
  Map<String, double> AllProteinIntakeEveryAmountOfFoods = {};
  Map<String, double> AllCarbIntakeEveryAmountOfFoods = {};

  Map<String, double> AllFatIntakeEveryAmountOfFoods = {};

  void CategorizationFood() {
    NutritionFacts.forEach((food, facts) {
      if (facts['protein']! > facts['carbohydrate']! &&
          facts['protein']! > facts['fat']!) {
        HighProteinFoods.addAll({food: facts});




        update();








      }

      if (facts['carbohydrate']! > facts['protein']! &&
          facts['carbohydrate']! > facts['fat']!) {
        HighCarbFoods.addAll({food: facts});
        update();

      }
      if (facts['fat']! > facts['protein']! &&
          facts['fat']! > facts['carbohydrate']!) {
        HighFatFoods.addAll({food: facts});
        update();

      }
      update();


    });
  }


  String? LowFattyProtienName;
  String? LowProtienCarbName;

  CalculateAmountsFood() {
    CategorizationFood();

// Protien Land

    double ProtienIntakeFromProSource = 0;
    double CarbIntakeFromProSource = 0;
    double FatIntakeFromProSource = 0;
    double ProtienIntakeFromCarbSource = 0;
    double CarbIntakeFromCarbSource = 0;
    double FatIntakeFromCarbSource = 0;

    double ProtienSuperUp = 0;
    double quantofgramsprotien =
        (targetProtein) / HighProteinFoods.length - ProtienSuperUp;

// Dont Touch My Meat

    ///------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//Carb Land


//Dont Touch My Rice

    ///------------------------------------------------------------------------------------------------------------------------------------------------------------------//

//Fat Land
    double ProtienIntakeFromFatSource = 0;
    double CarbIntakeFromFatSource = 0;
    double FatIntakeFromFatSource = 0;
    double CaloriesFromProtien = 0;
    double CaloriesFromCarb = 0;
    double CaloriesFromFat = 0;
    // ignore: unused_local_variable
    String? HighFattyProtienName;
    String? HighestFatCalorie;

//Dont Touch My Oil
    HighProteinFoods.forEach((food, quantity) {
      double? highestFatContent = 0;
      double? lowestFatContent = 0;
      double? quantofcalorie;
      double? quantofprotein;
      double? quantofcarbohydrate;
      double? quantoffat;
      double? quantofgrams;

      quantofgrams = quantofgramsprotien / NutritionFacts[food]!['protein']!;
      AllProteinIntakeEveryAmountOfFoods.addAll({food: quantofgrams});
      quantofprotein = quantofgrams * NutritionFacts[food]!['protein']!;
      ProtienIntakeFromProSource += quantofprotein;
      quantofcalorie = quantofgrams * NutritionFacts[food]!['calories']!;
      CaloriesFromProtien += quantofcalorie;
      quantofcarbohydrate =
          quantofgrams * NutritionFacts[food]!['carbohydrate']!;
      CarbIntakeFromProSource += quantofcarbohydrate;
      quantoffat = quantofgrams * NutritionFacts[food]!['fat']!;
      FatIntakeFromProSource += quantoffat;
      if (quantity['fat']! > highestFatContent) {
        highestFatContent = quantity['fat'];
        HighFattyProtienName = food;
      }
      if (HighProteinFoods.length > 1) {
        if (quantity['fat']! <= lowestFatContent) {
          lowestFatContent = quantity['fat'];
          LowFattyProtienName = food;
        }
      } else {
        LowFattyProtienName = food;
      }
    });

    HighCarbFoods.forEach((food, quantity) {
      double? quantofgrams;
      double? quantofcalorie;
      double? quantofprotein;
      double? quantofcarbohydrate;
      double? quantoffat;
      double minProtein = double.infinity;

      quantofgrams = (targetCarbs) /
          HighCarbFoods.length /
          NutritionFacts[food]!['carbohydrate']!;
      AllCarbIntakeEveryAmountOfFoods.addAll({food: quantofgrams});

      quantofprotein = quantofgrams * NutritionFacts[food]!['protein']!;
      ProtienIntakeFromCarbSource += quantofprotein;

      quantofcalorie = quantofgrams * NutritionFacts[food]!['calories']!;
      CaloriesFromCarb += quantofcalorie;

      quantofcarbohydrate =
          quantofgrams * NutritionFacts[food]!['carbohydrate']!;
      CarbIntakeFromCarbSource += quantofcarbohydrate;

      quantoffat = quantofgrams * NutritionFacts[food]!['fat']!;
      FatIntakeFromCarbSource += quantoffat;

      for (String food in HighCarbFoods.keys) {
        double protein = HighCarbFoods[food]!['protein']!;
        if (protein < minProtein) {
          minProtein = protein;
          LowProtienCarbName = food;
        }
      }
    });

    HighFatFoods.forEach((food, quantity) {
      double? quantofgrams;
      double? quantofcalorie;
      double? quantofprotein;
      double? quantofcarbohydrate;
      double? quantoffat;
      double maxProtein = 0;

      quantofgrams =
          (targetFat) / HighFatFoods.length / NutritionFacts[food]!['fat']!;
      AllFatIntakeEveryAmountOfFoods.addAll({food: quantofgrams});
      quantofprotein = quantofgrams * NutritionFacts[food]!['protein']!;
      ProtienIntakeFromFatSource += quantofprotein;

      quantofcalorie = quantofgrams * NutritionFacts[food]!['calories']!;
      CaloriesFromFat += quantofcalorie;

      quantofcarbohydrate =
          quantofgrams * NutritionFacts[food]!['carbohydrate']!;
      CarbIntakeFromFatSource += quantofcarbohydrate;

      quantoffat = quantofgrams * NutritionFacts[food]!['fat']!;
      FatIntakeFromFatSource += quantoffat;

      for (String food in HighFatFoods.keys) {
        double fat = HighFatFoods[food]!['fat']!;
        if (fat > maxProtein) {
          maxProtein = fat;
          HighestFatCalorie = food;
        }
      }
    });

    void AdjustProtien() {
      ProtienIntakeFromProSource = 0;
      CarbIntakeFromProSource = 0;
      FatIntakeFromProSource = 0;
      CaloriesFromProtien = 0;
      HighProteinFoods.forEach((food, quantity) {
        double? highestFatContent = 0;
        double? lowestFatContent = 0;
        double? quantofcalorie;
        double? quantofprotein;
        double? quantofcarbohydrate;
        double? quantoffat;
        double? quantofgrams;
        quantofgrams = AllProteinIntakeEveryAmountOfFoods[food];
        quantofprotein = (quantofgrams! * NutritionFacts[food]!['protein']!);
        ProtienIntakeFromProSource += quantofprotein;
        quantofcalorie = quantofgrams * NutritionFacts[food]!['calories']!;
        CaloriesFromProtien += quantofcalorie;
        quantofcarbohydrate =
            quantofgrams * NutritionFacts[food]!['carbohydrate']!;
        CarbIntakeFromProSource += quantofcarbohydrate;
        quantoffat = quantofgrams * NutritionFacts[food]!['fat']!;
        FatIntakeFromProSource += quantoffat;
        if (quantity['fat']! > highestFatContent) {
          highestFatContent = quantity['fat'];
          HighFattyProtienName = food;
        }
        if (quantity['fat']! <= lowestFatContent) {
          lowestFatContent = quantity['fat'];
          LowFattyProtienName = food;
        }
      });
    }

    void AdjustCarbohydrate() {
      ProtienIntakeFromCarbSource = 0;
      CarbIntakeFromCarbSource = 0;
      FatIntakeFromCarbSource = 0;
      CaloriesFromCarb = 0;
      HighCarbFoods.forEach((food, quantity) {
        double? quantofcalorie;
        double? quantofprotein;
        double? quantofcarbohydrate;
        double? quantoffat;
        double? quantofgrams;
        quantofgrams = AllCarbIntakeEveryAmountOfFoods[food];
        quantofprotein = (quantofgrams! * NutritionFacts[food]!['protein']!);
        ProtienIntakeFromCarbSource += quantofprotein;

        quantofcalorie = quantofgrams * NutritionFacts[food]!['calories']!;
        CaloriesFromCarb += quantofcalorie;

        quantofcarbohydrate =
            quantofgrams * NutritionFacts[food]!['carbohydrate']!;
        CarbIntakeFromCarbSource += quantofcarbohydrate;

        quantoffat = quantofgrams * NutritionFacts[food]!['fat']!;

        FatIntakeFromCarbSource += quantoffat.abs();
      });
    }

    AdjustFat() {
      ProtienIntakeFromFatSource = 0;
      CarbIntakeFromFatSource = 0;
      FatIntakeFromFatSource = 0;
      CaloriesFromFat = 0;

      HighFatFoods.forEach((food, quantity) {
        double? quantofgrams;
        double? quantofcalorie;
        double? quantofprotein;
        double? quantofcarbohydrate;
        double? quantoffat;

        quantofgrams = AllFatIntakeEveryAmountOfFoods[food];
        quantofprotein = (quantofgrams! * NutritionFacts[food]!['protein']!);
        ProtienIntakeFromFatSource += quantofprotein;

        quantofcalorie = quantofgrams * NutritionFacts[food]!['calories']!;
        CaloriesFromFat += quantofcalorie;

        quantofcarbohydrate =
            quantofgrams * NutritionFacts[food]!['carbohydrate']!;
        CarbIntakeFromFatSource += quantofcarbohydrate;

        quantoffat = quantofgrams * NutritionFacts[food]!['fat']!;
        FatIntakeFromFatSource += quantoffat;
      });
    }

    bool PrefereFat = true;
    while ((CaloriesFromProtien + CaloriesFromCarb + CaloriesFromFat) > Tdee &&
        PrefereFat == false) {
      if (FatIntakeFromProSource +
          FatIntakeFromCarbSource +
          FatIntakeFromFatSource >
          targetFat) {
        double zyada = (FatIntakeFromProSource +
            FatIntakeFromCarbSource +
            FatIntakeFromFatSource) -
            targetFat;

        AllFatIntakeEveryAmountOfFoods.update(
            HighestFatCalorie!,
                (value) =>
            value - (zyada) / HighFatFoods[HighestFatCalorie]!['fat']!);

        AdjustFat();
      }

      if ((CarbIntakeFromProSource +
          CarbIntakeFromCarbSource +
          CarbIntakeFromFatSource) >
          targetCarbs) {
        double zyada = (CarbIntakeFromProSource +
            CarbIntakeFromCarbSource +
            CarbIntakeFromFatSource) -
            targetCarbs;

        AllCarbIntakeEveryAmountOfFoods.update(
            LowProtienCarbName!,
                (value) =>
            value -
                (zyada) / HighCarbFoods[LowProtienCarbName]!['carbohydrate']!);
        AdjustCarbohydrate();
      }

      if ((ProtienIntakeFromProSource +
          ProtienIntakeFromCarbSource +
          ProtienIntakeFromFatSource) >
          targetProtein) {
        double zyada = ProtienIntakeFromProSource +
            ProtienIntakeFromCarbSource +
            ProtienIntakeFromFatSource -
            targetProtein;

        AllProteinIntakeEveryAmountOfFoods.update(
            LowFattyProtienName!,
                (value) =>
            value -
                (zyada) / HighProteinFoods[LowFattyProtienName]!["protein"]!);
        AdjustProtien();
      }

      double zyadacal =
          (CaloriesFromProtien + CaloriesFromCarb + CaloriesFromFat) - Tdee;

      AllFatIntakeEveryAmountOfFoods.update(
          HighestFatCalorie!,
              (value) =>
          value - (zyadacal) / HighFatFoods[HighestFatCalorie]!['calories']!);

      AdjustFat();
    }

    while ((CaloriesFromProtien + CaloriesFromCarb + CaloriesFromFat) > Tdee &&
        PrefereFat == true) {
      if ((CarbIntakeFromProSource +
          CarbIntakeFromCarbSource +
          CarbIntakeFromFatSource) >
          targetCarbs) {
        double zyada = (CarbIntakeFromProSource +
            CarbIntakeFromCarbSource +
            CarbIntakeFromFatSource) -
            targetCarbs;

        AllCarbIntakeEveryAmountOfFoods.update(
            LowProtienCarbName!,
                (value) =>
            value -
                (zyada) / HighCarbFoods[LowProtienCarbName]!['carbohydrate']!);
        AdjustCarbohydrate();
      }

      if (FatIntakeFromProSource +
          FatIntakeFromCarbSource +
          FatIntakeFromFatSource >
          targetFat) {
        double zyada = (FatIntakeFromProSource +
            FatIntakeFromCarbSource +
            FatIntakeFromFatSource) -
            targetFat;

        AllFatIntakeEveryAmountOfFoods.update(
            HighestFatCalorie!,
                (value) =>
            value - (zyada) / HighFatFoods[HighestFatCalorie]!['fat']!);

        AdjustFat();
      }

      if ((ProtienIntakeFromProSource +
          ProtienIntakeFromCarbSource +
          ProtienIntakeFromFatSource) >
          targetProtein) {
        double zyada = ProtienIntakeFromProSource +
            ProtienIntakeFromCarbSource +
            ProtienIntakeFromFatSource -
            targetProtein;

        AllProteinIntakeEveryAmountOfFoods.update(
            LowFattyProtienName!,
                (value) =>
            value -
                (zyada) / HighProteinFoods[LowFattyProtienName]!["protein"]!);
        AdjustProtien();
      }

      double zyadacal =
          (CaloriesFromProtien + CaloriesFromCarb + CaloriesFromFat) - Tdee;

      AllCarbIntakeEveryAmountOfFoods.update(
          LowProtienCarbName!,
              (value) =>
          value -
              (zyadacal) / HighCarbFoods[LowProtienCarbName]!['calories']!);

      AdjustCarbohydrate();
    }


    AllProteinIntakeEveryAmountOfFoods.forEach((key, value) {
     // protienfrompro=AllProteinIntakeEveryAmountOfFoods


    });










    update();

    return Tdee;
  }


  void submitForm(dynamic key, formkey2, Key formkey3, Key formkey4, Key formkey5,) {
    if (key.currentState!.validate()) {
      key.currentState!.save();
    }
  }

  double progressValue = 0.0;


    void updateProgressValue(dynamic controller) {

    }

List aah=[];


foodQuantities(){
 

  AllProteinIntakeEveryAmountOfFoods.forEach((key, value) {
    foodquantities.addIf(1==1, key, value);
    update();
  });
  AllCarbIntakeEveryAmountOfFoods.forEach((key, value) {
    foodquantities.addIf(1==1, key, value);
    update();
  });
  AllFatIntakeEveryAmountOfFoods.forEach((key, value) {
    foodquantities.addIf(1==1, key, value);
    update();
  });

  foodquantitiessaver.addAll(foodquantities);

update();

}


Future<bool>? AdjustQuantities(dynamic context) async{
return await showDialog(context: context, builder: (context) =>
    const AlertDialog (title: Text("Adjust Quantities"),),);

}


  ///END THE FUNCTION LAND///

bool bz=false;




  double profpro=0;

  double profcarb=0;
  double proffat=0;
  double carbfpro=0;
  double carbfcarb=0;
  double carbffat=0;
  double fatfpro=0;
  double fatfcarb=0;
  double fatffat=0;
  double calfpro=0;
  double calfcarb=0;
  double calffat=0;

   ResponsiveQuantity(){
     calfpro=0;profpro=0;carbfpro=0;fatfpro=0;
     calfcarb=0;profcarb=0;carbfcarb=0;fatfcarb=0;
     calffat=0;proffat=0;carbffat=0;fatffat=0;
update();
     foodquantities.forEach((k, value) {
  AllProteinIntakeEveryAmountOfFoods.forEach((key, v) {
        if(key==k) {
          calfpro += (HighProteinFoods[key]!["calories"]! * value);
          profpro += (HighProteinFoods[key]!["protein"]! * value);
          carbfpro += (HighProteinFoods[key]!["carbohydrate"]! * value);
          fatfpro += (HighProteinFoods[key]!["fat"]! * value);
          update();
        }});
     });


     foodquantities.forEach((k, value) {
      AllCarbIntakeEveryAmountOfFoods.forEach((key, v) {
        if(key==k) {
          calfcarb += (HighCarbFoods[key]!["calories"]! * value);
          profcarb += (HighCarbFoods[key]!["protein"]! * value);
          carbfcarb += (HighCarbFoods[key]!["carbohydrate"]! * value);
          fatfcarb += (HighCarbFoods[key]!["fat"]! * value);
          update();
        }
      });
     });


     foodquantities.forEach((k, value) {
      AllFatIntakeEveryAmountOfFoods.forEach((key, v) {
        if(key==k) {
          calffat += (HighFatFoods[key]!["calories"]! * value);
          proffat += (HighFatFoods[key]!["protein"]! * value);
          carbffat += (HighFatFoods[key]!["carbohydrate"]! * value);
          fatffat += (HighFatFoods[key]!["fat"]! * value);
          update();
        }
      });

     });
     update();

   }


  gg(){
    int halfLength = (namelist.length / 1).ceil();

     s = namelist.take(halfLength).map((element) => element.foodName.toString()).join(',');



   }





   showFoodDetails(BuildContext context, String? foodImage) {



   }



















































































}
