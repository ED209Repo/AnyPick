class ResponseModel{
  final int? statusCode;
  final String? statusMessage;
  final String? errorMessage;
  final String? data;

  ResponseModel({this.statusMessage,this.data,this.statusCode,this.errorMessage});
  factory ResponseModel.fromJson(Map<String, dynamic> json){
    return ResponseModel(
      statusCode: json['statusCode'],
      statusMessage: json['statusMessage'] ,
      data: json['data'],
      errorMessage: json['errorMessage'],
    );
  }

  toList() {}
}

//Near By Screen Model

class RestaurantModel {
  final int? rest_Id;
  final String? restaurant_Name;
  final String? open_Close_Time;
  final String? off_days;
  final String? restaurant_Type;
  final String? business_Id;
  final String? licenses_Id;
  final List<RestaurantCategoryModel>? rest_Cat;
  final List<FoodItemModel>? food_Items; // Added list of food items

  RestaurantModel({
    this.rest_Id,
    this.restaurant_Name,
    this.open_Close_Time,
    this.off_days,
    this.restaurant_Type,
    this.business_Id,
    this.licenses_Id,
    this.rest_Cat,
    this.food_Items, // Initialize with an empty list or fetch from API
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    List<RestaurantCategoryModel>? categories;
    if (json['rest_Cat_'] != null) {
      categories = List<RestaurantCategoryModel>.from(json['rest_Cat_'].map(
        (categoryJson) => RestaurantCategoryModel.fromJson(categoryJson),
      ));
    }

    List<FoodItemModel>? foodItems; // Add this
  if (json['food_Items'] != null) {
    foodItems = List<FoodItemModel>.from(json['food_Items'].map(
      (foodItemJson) => FoodItemModel.fromJson(foodItemJson),
    ));
  }

    return RestaurantModel(
      rest_Id: json['rest_Id'],
      restaurant_Name: json['resturant_Name'],
      open_Close_Time: json['open_Close_Time'],
      off_days: json['offdays'],
      restaurant_Type: json['resturant_type'],
      business_Id: json['business_Id'],
      licenses_Id: json['licesnes_Id'],
      rest_Cat: categories,
      food_Items: foodItems, // Add this
    );
  }
}
class RestaurantCategoryModel {
  final int? rest_Cat_Id;
  final int? rest_Id;
  final int? cat_Temp_Id;
  final String? name;
  final int? parent_Category;
  final List<FoodItemModel>? getting_Food_Items;

  RestaurantCategoryModel({
    this.rest_Cat_Id,
    this.rest_Id,
    this.cat_Temp_Id,
    this.name,
    this.parent_Category,
    this.getting_Food_Items,
  });

  factory RestaurantCategoryModel.fromJson(Map<String, dynamic> json) {
    List<FoodItemModel>? foodItems;
    if (json['getting_Food_Items'] != null) {
      foodItems = List<FoodItemModel>.from(json['getting_Food_Items'].map(
        (foodItemJson) => FoodItemModel.fromJson(foodItemJson),
      ));
    }

    return RestaurantCategoryModel(
      rest_Cat_Id: json['rest_Cat_Id'],
      rest_Id: json['rest_Id'],
      cat_Temp_Id: json['cat_Temp_Id'],
      name: json['name'],
      parent_Category: json['parent_Category'],
      getting_Food_Items: foodItems,
    );
  }
}

class FoodItemModel {
  final int? food_Item_Id;
  final int? rest_Cat_Id;
  final String? name;
  final String? description;
  final String? unit;
  final String? unit_PerPrice;
  final String? prepare_Time;
  final List<VariationModel>? variations;

  FoodItemModel({
    this.food_Item_Id,
    this.rest_Cat_Id,
    this.name,
    this.description,
    this.unit,
    this.unit_PerPrice,
    this.prepare_Time,
    this.variations,
  });

  factory FoodItemModel.fromJson(Map<String, dynamic> json) {
    List<VariationModel>? variations;
    if (json['variations'] != null) {
      variations = List<VariationModel>.from(json['variations'].map(
        (variationJson) => VariationModel.fromJson(variationJson),
      ));
    }

    return FoodItemModel(
      food_Item_Id: json['food_Item_Id'],
      rest_Cat_Id: json['rest_Cat_Id'],
      name: json['name'],
      description: json['description'],
      unit: json['unit'],
      unit_PerPrice: json['unit_PerPrice'],
      prepare_Time: json['prepare_Time'],
      variations: variations,
    );
  }
}

class VariationModel {
  final int? vId;
  final int? food_Item_Id;
  final String? name;
  final int? type;
  final String? price_Dependent;
  final List<VariationOptionModel>? variation_Options;

  VariationModel({
    this.vId,
    this.food_Item_Id,
    this.name,
    this.type,
    this.price_Dependent,
    this.variation_Options,
  });

  factory VariationModel.fromJson(Map<String, dynamic> json) {
    List<VariationOptionModel>? variationOptions;
    if (json['variation_Options'] != null) {
      variationOptions = List<VariationOptionModel>.from(json['variation_Options'].map(
        (optionJson) => VariationOptionModel.fromJson(optionJson),
      ));
    }

    return VariationModel(
      vId: json['vId'],
      food_Item_Id: json['food_Item_Id'],
      name: json['name'],
      type: json['type'],
      price_Dependent: json['price_Dependent'],
      variation_Options: variationOptions,
    );
  }
}

class VariationOptionModel {
  final int? v_Op_Id;
  final int? v_Id;
  final String? name;
  final String? price_Dependent;
  final String? price;
  final String? add_Price;
  final String? annotation;

  VariationOptionModel({
    this.v_Op_Id,
    this.v_Id,
    this.name,
    this.price_Dependent,
    this.price,
    this.add_Price,
    this.annotation,
  });

  factory VariationOptionModel.fromJson(Map<String, dynamic> json) {
    return VariationOptionModel(
      v_Op_Id: json['v_Op_Id'],
      v_Id: json['v_Id'],
      name: json['name'],
      price_Dependent: json['price_Dependent'],
      price: json['price'],
      add_Price: json['add_Price'],
      annotation: json['annotation'],
    );
  }
}



