import 'package:flutter/material.dart';
import 'package:nepaltop/components/catalog_model.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OHR Store'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () {},
              leading: Image.network(items[index].img,
              ),
              title: Text(
                items[index].name,
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,fontSize: 20),
                    
              ),
              subtitle: Text(items[index].desc,style: TextStyle(color: Colors.brown),),
              trailing: Text('\$${items[index].price}',textScaleFactor: 1.4, style: TextStyle(color: Colors.green[800]),),
            ),
          );
        },
      ),
    );
  }
}
