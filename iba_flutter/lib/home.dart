import 'package:flutter/material.dart';
import 'package:iba_flutter/model/product.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

List<Card> _buildGridCard(int count){
  List<Card> cards = List.generate(
    count, 
  (int index){
    return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0/11.0,
                child: Image.asset('assets/flutterlogo.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Title'),
                    const SizedBox(height: 8.0),
                    Text('Secondary Text'),
                  ],
                ),
              ),
              ],
          ),
    );
  }
  );
  return cards;
}
  @override
  Widget build(BuildContext context) {
       return Scaffold(
       appBar: AppBar(
          title: const Text('SHRINE'), 
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: (){
              print('Menu Button');
            },
          ),

          actions: <Widget>[
            IconButton(
            icon: const Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: (){
              print('Search Button');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: (){
              print('Filter Button');
            },
          ),
          ]
        ),

        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 8.0/9.0,
          children: _buildGridCards(context) ),
        resizeToAvoidBottomInset: false,
    );
  }
  
  
  List<Card> _buildGridCards(BuildContext context) {
    List <Product> products = mockProducts;
     
    if (products.isEmpty) {
      return const <Card>[];
    }
    
    return products.map((product) {
      return Card (
        clipBehavior: Clip.antiAlias,
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18/11,
              child: Image.network (
                product.ImageUrl,
              ),
            ),
            Expanded(
              child: Padding (
                padding: const EdgeInsets.fromLTRB(16,12,16,8),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product.name,
                      //style: theme.textTheme.titleLarge,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 8),
                    Text (
                      product.price,
                      //style:theme.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      );
    }
    ).toList();

    // List<Card> cards = List.generate(
    //   count,
    //   (int index) {
    //     return Card(
    //       clipBehavior: Clip.antiAlias,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           AspectRatio(
    //             aspectRatio: 18.0 / 11.0,
    //             child: Image.network('https://img.icons8.com/?size=96&id=7I3BjCqe9rjG&format=png'),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: const <Widget>[
    //                 Text('Title'),
    //                 SizedBox(height: 8.0),
    //                 Text('Secondary Text'),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
    // return cards;
  }
}