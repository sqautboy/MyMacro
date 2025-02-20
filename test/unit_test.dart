import 'package:diet_macro/data/datasources/local/isar_datasource.dart';
import 'package:diet_macro/data/datasources/remote/food_search_api.dart';
import 'package:diet_macro/data/models/food_model.dart';
import 'package:diet_macro/data/models/isar_data.dart';
import 'package:diet_macro/data/repositories/daily_data/daily_data_repository_impl.dart';
import 'package:diet_macro/data/repositories/food_search/food_repository_impl.dart';
import 'package:diet_macro/utils/data_process.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'unit_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IsarDatasource>(), MockSpec<FoodSearchApi>()])
void main() {
  group("DailyDataRepositoryImpl", () {
    late MockIsarDatasource mockIsarDatasource;
    late DailyDataRepositoryImpl dailyDataRepositoryImpl;

    setUp(() {
      mockIsarDatasource = MockIsarDatasource();
      dailyDataRepositoryImpl = DailyDataRepositoryImpl();
    });

    test("getDailyDataForToday should return existing data from database", () async {
      // Arrange
      final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
      final existingData = DailyData();
      when(mockIsarDatasource.getDailyDataByDate(now)).thenAnswer((_) async => existingData);

      // Act
      final result = await dailyDataRepositoryImpl.getDailyDataForToday();

      // Assert
      expect(result, existingData);
      verify(mockIsarDatasource.getDailyDataByDate(now)).called(1);
    });

    test("getDailyDataForToday should create new DailyData if no data exists", () async {
      // Arrange
      final now = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
      when(mockIsarDatasource.getDailyDataByDate(now)).thenAnswer((_) async => null);

      // Act
      final result = await dailyDataRepositoryImpl.getDailyDataForToday();

      // Assert
      expect(result, isA<DailyData>());
      verify(mockIsarDatasource.getDailyDataByDate(now)).called(1);
    });
  });

  group("FoodRepositoryImpl", () {
    late MockFoodSearchApi mockFoodSearchApi;
    late FoodRepositoryImpl foodRepositoryImpl;

    setUp(() {
      mockFoodSearchApi = MockFoodSearchApi();
      foodRepositoryImpl = FoodRepositoryImpl(mockFoodSearchApi);
    });

    test("_parseFoodNutrition should correctly parse JSON response", () async {
      // Arrange
      final responseBody = """
      {
        "foods": {
          "food": [
            {
              "food_name": "Banana",
              "food_description": "Per 100g - Calories: 89kcal | Fat: 0.33g | Carbs: 22.84g | Protein: 1.09g"
            },
            {
              "food_name": "Apple",
              "food_description": "Per 100g - Calories: 52kcal | Fat: 0.17g | Carbs: 13.81g | Protein: 0.26g"
            }
          ]
        }
      }
      """;

      // Act
      when(mockFoodSearchApi.fetchFoodNutrition(any)).thenAnswer((_) async => responseBody);

      // Act
      final result = await foodRepositoryImpl.getFoodNutrition('test');

      // Assert
      expect(result, isA<List<FoodNutrition>>());
      expect(result.length, 2);
      expect(result[0].name, "Banana");
      expect(result[0].calories, 89);
      expect(result[0].fat, 0);
      expect(result[0].carbs, 23);
      expect(result[0].protein, 1);
      expect(result[0].servingUnit, "100g");
      expect(result[1].name, "Apple");
      expect(result[1].calories, 52);
      expect(result[1].fat, 0);
      expect(result[1].carbs, 14);
      expect(result[1].protein, 0);
      expect(result[1].servingUnit, "100g");
    });
  });

  group("parseFoodNutrition", () {
    test("should correctly parse food_description and add FoodNutrition to list", () {
      // Arrange
      final food = {
        "food_name": "Banana",
        "food_description": "Per 100g - Calories: 89kcal | Fat: 0.33g | Carbs: 22.84g | Protein: 1.09g"
      };
      final foodNutritions = <FoodNutrition>[];

      // Act
      parseFoodNutrition(food, foodNutritions);

      // Assert
      expect(foodNutritions.length, 1);
      expect(foodNutritions[0].name, "Banana");
      expect(foodNutritions[0].calories, 89);
      expect(foodNutritions[0].fat, 0);
      expect(foodNutritions[0].carbs, 23);
      expect(foodNutritions[0].protein, 1);
      expect(foodNutritions[0].servingUnit, "100g");
    });
  });
}
