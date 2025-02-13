import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        // TODO: Replace child: Container()
        //4
        child: ListView.builder(
            //5
            itemCount: Recipe.samples.length,
            //6
            itemBuilder: (BuildContext context, int index) {
              //7
              // TODO: Update to return Recipe card
              //TODO: Add GestureDetector
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context){
                        
                        //TODO: Replace return witg return RecipeDetail()
                        return RecipeDetail(recipe: Recipe.samples[index]);
                        },
                      ),
                  );
                },
              child: buildRecipeCard(Recipe.samples[index]),
              );
              
            }
          ),
      ),
    );
  }
  // TODO: Add buildRecipeCard() here
  Widget buildRecipeCard(Recipe recipe) {
    return Card(

      elevation: 2.0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),

      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          
          const SizedBox(
            height: 14.0,
          ),

          Text (
            recipe.label,
            style: const TextStyle(
              fontSize:20.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}