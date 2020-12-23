import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

//import 'package:infinity/models/course_model.dart';
import 'package:timeline/models/course_model.dart';
export 'package:timeline/models/course_model.dart';
//export 'package:infinity/models/course_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    // Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'CoursesDataBase.db');
    //print(path);

    // Crear base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Courses(
            id INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT
          )
        ''');
    });
  }

  // Insertar nuevos cursos en la tabla

  Future<int> nuevoCourseRaw(CourseModel nuevoCourse) async {
    final id = nuevoCourse.id;
    final name = nuevoCourse.name;
    final description = nuevoCourse.description;

    // Verificar la base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO Courses( id, name, description )
        VALUES( $id, '$name', '$description' )
    ''');

    // Registros insertados
    print(res);

    return res;
  }

  Future<int> nuevoCourse(CourseModel nuevoCourse) async {
    final db = await database;
    final res = await db.insert('Courses', nuevoCourse.toJson());

    // Es el ID del último registro insertado;
    return res;
  }

  // Get info in table

  Future<CourseModel> getCourseById(int id) async {
    final db = await database;
    final res = await db.query('Courses', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? CourseModel.fromJson(res.first) : null;
  }

  Future<List<CourseModel>> getTodosLosCourses() async {
    final db = await database;
    final res = await db.query('Courses');

    return res.isNotEmpty
        ? res.map((s) => CourseModel.fromJson(s)).toList()
        : [];
  }

  // Actualizar los Cursos, aun no esta implementada
  Future<int> updateCourse(CourseModel nuevoCourse) async {
    final db = await database;
    final res = await db.update('Courses', nuevoCourse.toJson(),
        where: 'id = ?', whereArgs: [nuevoCourse.id]);
    return res;
  }

  // Eliminar Cursos
  Future<int> deleteCourse(int id) async {
    final db = await database;
    final res = await db.delete('Courses', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  // Eliminar todos los cursos
  Future<int> deleteAllCourses() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM Courses    
    ''');
    return res;
  }
}
