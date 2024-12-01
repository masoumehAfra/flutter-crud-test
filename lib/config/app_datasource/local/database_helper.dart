import 'package:mc_crud_test/features/register/domain/params/cosumer_param.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'customer_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE customers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      firstname TEXT,
      lastname TEXT,
      dateOfBirth TEXT,
      phoneNumber TEXT,
      email TEXT UNIQUE, 
      bankAccountNumber TEXT
    )
  ''');
  }



  Future<int> saveCustomer(CustomerParams param) async {
    final db = await database;
    try {
      return await db.insert('customers', param.toMap());
    } catch (e) {
      if (e is DatabaseException && e.isUniqueConstraintError()) {
        print('Error: Email must be unique.');
        return -1; // Indicate failure due to unique constraint
      } else {
        throw e;
      }
    }
  }

}
