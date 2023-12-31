// ignore_for_file: prefer_const_constructors, prefer_final_fields, sized_box_for_whitespace, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tastequest/viewmodels/auth_view_model.dart';
import 'package:tastequest/viewmodels/home_view_model.dart';
import 'package:tastequest/views/welcome_page.dart';
import 'package:tastequest/widgets/recipe_card.dart';
import 'package:tastequest/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>['s', 'w', 's', 's', 's'];
  // ignore: unused_field
  FirebaseAuth _auth = FirebaseAuth.instance;
  final homeViewModel = Get.put<HomeViewModel>(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        initState: (_) {
          Get.find<HomeViewModel>();
        },
        builder: (controller) => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _customHeaderWidget(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: _searchTextFormField()),
                            SizedBox(
                              width: 15,
                            ),
                            CustomElevatedButton(
                              onPressed: () {},
                              kHeight: 50,
                              kwidth: 65,
                              kradius: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _lestViewCategory(),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text: 'Recipe Of The Day',
                          fontSize: 20,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          return homeViewModel.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : RecipeCard();
                        }),
                      ],
                    ),
                  ),
                ),
              ));
  }

  Widget _lestViewCategory() {
    return GetBuilder<HomeViewModel>(
        builder: (controller) => Container(
              height: 140,
              child: ListView.separated(
                  itemCount: controller.categoryModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade100,
                          ),
                          height: 80,
                          width: 80,
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.network(
                                  controller.categoryModel[index].image)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          text: controller.categoryModel[index].name,
                          fontSize: 12,
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      )),
            ));
  }

  // ignore: non_constant_identifier_names
  Widget _customHeaderWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'Recipe Catalog',
          fontSize: 30,
        ),
        Container(
          height: 80,
          width: 80,
          child: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/UserIcon.jpg'),
          ),
        )
      ],
    );
  }
}

Widget _searchTextFormField() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey.shade300),
    child: TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    ),
  );
}
