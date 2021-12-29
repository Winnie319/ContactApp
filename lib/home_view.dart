import 'package:contacts_app/contact_details_view.dart';
import 'package:contacts_app/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> data = [
    {
      "name": "Forrest Tucker",
      "phone": "1-985-826-5185",
      "email": "sagittis.augue.eu@outlook.com",
      "region": "Hà Nam",
      "country": "Russian Federation",
      "picture":"assets/Images/pic3.jpg"
    },
    {
      "name": "Geoffrey Potts",
      "phone": "1-654-815-2671",
      "email": "malesuada.ut@protonmail.com",
      "region": "Västra Götalands län",
      "country": "United Kingdom",
      "picture":"assets/Images/pic1.jpg"
    },
    {
      "name": "Alex Bradley Newton",
      "phone": "236-2175",
      "email": "mi.enim.condimentum@outlook.edu",
      "region": "FATA",
      "country": "Canada",
      "picture":"assets/Images/pic2.jpg"
    },
    {
      "name": "Brett Villarreal",
      "phone": "885-1393",
      "email": "in.faucibus.morbi@outlook.com",
      "region": "West Papua",
      "country": "Chile",
      "picture":"assets/Images/pic.jpg"
    },
    {
      "name": "Bradley Montoya",
      "phone": "565-5714",
      "email": "tempus.non.lacinia@protonmail.edu",
      "region": "Arequipa",
      "country": "Poland",
      "picture":"assets/Images/pic2.jpg"

    },
    {
      "name": "Henry Barrera",
      "phone": "1-555-781-7317",
      "email": "justo.eu@hotmail.edu",
      "region": "Aquitaine",
      "country": "Germany",
      "picture":"assets/Images/pic.jpg"
    },
    {
      "name": "Eaton Decker",
      "phone": "763-0918",
      "email": "tincidunt.orci.quis@icloud.org",
      "region": "Maranhão",
      "country": "New Zealand",
      "picture":"assets/Images/pic1.jpg"
    },
    {
      "name": "Justina Terry",
      "phone": "1-608-468-7141",
      "email": "dis.parturient.montes@icloud.org",
      "region": "Northwest Territories",
      "country": "United Kingdom",
      "picture":"assets/Images/pic3.jpg"
    },
    {
      "name": "Teagan Suarez",
      "phone": "770-5299",
      "email": "quisque.libero@aol.com",
      "region": "Haryana",
      "country": "Germany",
      "picture":"assets/Images/pic2.jpg"
    },
    {
      "name": "Orla Payne",
      "phone": "1-692-351-2533",
      "email": "et.nunc@outlook.net",
      "region": "Kaduna",
      "country": "United States",
      "picture":"assets/Images/pic.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/images/pic3.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  ListTile(
                    onTap: (){
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)
                      {return ContactDetailsView(
                        contact: Contact(country: 'Ghana',
                        email: 'edwin@gmail.com',
                        name: 'Edwin',
                        phone: '+233 345 678 345',
                        region: ' Accra',
                        picture: 'assets/Images/pic.jpg'
                        ));
                      }));
                    },
                    leading:const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/pic.jpg'),
                    ),
                    title:const Text(
                      '	Eddie edwin',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('+233 24 54 36 757'),
                    trailing:const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.more_horiz),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              elements: data,
              shrinkWrap: true,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                children: [
                  ListTile(
                    onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactDetailsView(contact: contact,);
          }));
                    },
                    leading:  CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('${element['picture']}'),
                    ),
                    title: Text(
                      '${element['name']}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text('${element['phone']}'),
                    trailing: const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.more_horiz),
                    ),
                  ),
                  const Divider(
                    indent: 25,
                    thickness: 2,
                  ),
                ],
              );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
