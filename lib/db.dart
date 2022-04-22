import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class myDB {
  late Database db;

  Future open() async{
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'test.db');
    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute('''

                    CREATE TABLE IF NOT EXISTS dokumen( 
                          id integer not null primary key autoincrement,
                          jenis_dokumen varchar(255) not null,
                          no_dokumen varchar(255) not null
                      );
                    
                    CREATE TABLE IF NOT EXISTS sertifikat( 
                          id integer not null primary key autoincrement,
                          jenis_sertifikat varchar(255) not null,
                          no_sertifikat varchar(255) not null 
                      );
                      

                      //create more table here
                  
                  ''');
          //table students will be created if there is no table 'students'
          print("Table Created");
        });
  }
  Future<Map<dynamic, dynamic>?> getDokumenByID(int id) async {
    List<Map> maps = await db.query('dokumen',
        where: 'id = ?',
        whereArgs: [id]);
    //getting student data with roll no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
  Future<Map<dynamic, dynamic>?> getSertifikatById(int id) async {
    List<Map> maps = await db.query('sertifikat',
        where: 'id = ?',
        whereArgs: [id]);
    //getting student data with roll no.
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
}