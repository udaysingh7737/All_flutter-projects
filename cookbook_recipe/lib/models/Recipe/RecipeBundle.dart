import 'package:flutter/material.dart';

class RecipeBundle{
  final int id, chefs, recipes;
  final String title, description, imageSrc;
  final Color color, divider_color;

  RecipeBundle({
    this.id,
    this.chefs,
    this.recipes,
    this.title,
    this.description,
    this.imageSrc,
    this.color,
    this.divider_color
  });
}


List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 19,
    title: "COOk Something owsone today",
    description: "now we cook new  owsome dishes every minute",
    imageSrc: "assets/images/best_2020@2x.png",
    color: Color(0xFF90AF17),
    divider_color: Color(0xFFD82D40),

  ),
  RecipeBundle(
    id: 2,
    chefs: 26,
    recipes: 29,
    title: "COOk Something owsone today",
    description: "now we cook new  owsome dishes every minute",
    imageSrc: "assets/images/food_court@2x.png",
    color: Color(0xFFD82D40),
    divider_color: Color(0xFFF1DE0A),
  ),
  RecipeBundle(
    id: 3,
    chefs: 36,
    recipes: 39,
    title: "COOk Something owsone today",
    description: "now we cook new  owsome dishes every minute",
    imageSrc: "assets/images/cook_new@2x.png",
    color: Colors.blue,
    divider_color: Color(0xFFD82D40),
  ),
  RecipeBundle(
    id: 4,
    chefs: 46,
    recipes: 49,
    title: "COOk Something owsone today",
    description: "now we cook new  owsome dishes every minute",
    imageSrc: "assets/images/kisspng_chicken_tikka.png",
    color: Color(0xFF9A09EA),
    divider_color: Color(0xFFAF1D0B),
  ),


];