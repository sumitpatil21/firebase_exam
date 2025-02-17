
import 'package:firebase_exam/Database/fireModalClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'db_Helper.dart';

class HomeController extends GetxController {
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    fetchValue();
    // await DbHelper.dbHelper.database;
    super.onInit();
  }

  RxDouble? income = 0.0.obs;
  RxDouble? expenses = 0.0.obs;
  RxDouble? balance = 0.0.obs;
  RxBool? isIncome = false.obs;
  RxInt selectedCategoryIndex = (-1).obs;

  void switchIncome(bool value) {
    isIncome!.value = value;
  }

  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  RxList<FireModal> budgetList = <FireModal>[].obs;
  //db insert
  Future<void> insertDb(
      double amount, String category, date, int isincome) async {
    await DbHelper.dbHelper.insertRecord(amount, category, date, isincome);
    await fetchValue();
  }

  Future<void> fetchValue() async {
    final record = await DbHelper.dbHelper.fetchData();
    budgetList.value = record
        .map(
          (e) => FireModal.fromjson(e),
    )
        .toList();
    calculateBalance();
  }

  Future<void> deleteDb(int index) async {
    await DbHelper.dbHelper.deleteData(index);
    await fetchValue();
  }

  Future<void> updateDb(
      int id, double amount, String category, String date, int isincome) async {
    await DbHelper.dbHelper.updateRecord(

         amount,
         category,
         date,
         isincome,
        );
    await fetchValue();
  }

  void calculateBalance() {
    double totalIncome = 0.0;
    double totalExpenses = 0.0;
    for (var record in budgetList) {
      if (record.income == 1) {
        totalIncome += record.amount!;
      } else {
        totalExpenses += record.amount!;
      }
    }
    income!.value = totalIncome;
    expenses!.value = totalExpenses;
    balance!.value = income!.value - expenses!.value;
  }
}
