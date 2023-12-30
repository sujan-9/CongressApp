import 'package:congressapp/app/core/common_widgets/custom_appbar.dart';
import 'package:congressapp/app/core/constants/pallets.dart';
import 'package:congressapp/app/utils/app_strings.dart';
import 'package:congressapp/presentation/home/widgets/topnews_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppbar(title: AppStrings.home),
        body: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Column(
            children: [
              TabBar(
                indicatorColor: redColor,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                tabs: [
                  Tab(
                    text: 'Top news',
                  ),
                  Tab(text: 'World news'),
                  Tab(text: 'Politics'),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    TopnewsPage(),
                    TopnewsPage(),
                    TopnewsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
