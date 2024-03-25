import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FvaoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FvaoriteMealsNotifier(): super([]);

  bool toggleMealFavouriteStatus(Meal meal){
    final mealsIsFavorite=state.contains(meal);
    
    if(mealsIsFavorite){
      state=state.where((m) => m.id!=meal.id).toList();
      return false;
    }
    else
    {
      state=[...state,meal];
      return true;
    }
  }
}
final favoriteMealsProvider=StateNotifierProvider<FvaoriteMealsNotifier,List<Meal>>((ref){
  return FvaoriteMealsNotifier();
});