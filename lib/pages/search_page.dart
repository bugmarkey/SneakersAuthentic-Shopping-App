import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui_ux/models/shoe.dart';
import 'package:ui_ux/pages/shoe_description_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ShoeList> shoes = [];
  List<ShoeList> filteredShoes = [];
  List<String> searchHistory = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchShoes();
    searchController.addListener(() {
      filterShoes();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchShoes() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    List<ShoeList> shoesList =
        snapshot.docs.map((doc) => ShoeList.fromFirestore(doc)).toList();
    setState(() {
      shoes = shoesList;
      filteredShoes = shoesList; // Initialize filteredShoes with all shoes
    });
  }

  void filterShoes() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredShoes = [];
      });
    } else {
      setState(() {
        filteredShoes = shoes.where((shoe) {
          return shoe.name.toLowerCase().contains(query);
        }).toList();
      });
    }
  }

  void addToSearchHistory(String query) {
    if (!searchHistory.contains(query)) {
      setState(() {
        searchHistory.add(query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Shoes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {
                      filteredShoes = [];
                    });
                  },
                ),
              ),
              onSubmitted: (query) {
                addToSearchHistory(query);
                filterShoes();
              },
            ),
          ),
          if (searchController.text.isEmpty && searchHistory.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Search History',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children: searchHistory.map((query) {
                      return ActionChip(
                        label: Text(query),
                        onPressed: () {
                          searchController.text = query;
                          filterShoes();
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          Expanded(
            child: filteredShoes.isEmpty
                ? const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredShoes.length,
                    itemBuilder: (context, index) {
                      final shoe = filteredShoes[index];
                      final query = searchController.text.toLowerCase();
                      final shoeName = shoe.name.toLowerCase();
                      final startIndex = shoeName.indexOf(query);
                      final endIndex = startIndex + query.length;

                      return ListTile(
                        title: RichText(
                          text: TextSpan(
                            text: shoe.name.substring(0, startIndex),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18.0, // Larger font size for shoe name
                            ),
                            children: [
                              TextSpan(
                                text: shoe.name.substring(startIndex, endIndex),
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      18.0, // Larger font size for shoe name
                                ),
                              ),
                              TextSpan(
                                text: shoe.name.substring(endIndex),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      18.0, // Larger font size for shoe name
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          shoe.category,
                          style: const TextStyle(
                            fontSize: 14.0, // Smaller font size for category
                          ),
                        ),
                        leading: shoe.imageUrl.isNotEmpty
                            ? Image.network(
                                shoe.imageUrl,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/jordan.png',
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ShoeDescription(shoe: shoe);
                          }));
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
