import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper db = DatabaseHelper._();
  static Database _database;
  final String _tblLoanApplication = "tblLoanApplication";

}
