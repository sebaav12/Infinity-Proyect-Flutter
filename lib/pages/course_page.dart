import 'package:flutter/material.dart';
import 'package:infinity/provider/ui_provider.dart';
import 'package:infinity/pages/cronometro_page.dart';
import 'package:infinity/pages/data_course_page.dart';
import 'package:infinity/pages/temporizador_page.dart';
import 'package:infinity/widgets/custom_navigationbar.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curso X'),
      ),
      body: _CoursePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _CoursePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    switch (currentIndex) {
      case 0:
        return DataCoursePage();

      case 1:
        return TemporizadorPage();

      case 2:
        return CronometroPage();

      default:
        return DataCoursePage();
    }
  }
}
