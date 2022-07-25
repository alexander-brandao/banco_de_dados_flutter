import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarBancoDeDados() async{

    final caminhoBancoDeDados = await getDatabasesPath();
    final localBancoDeDados = join(caminhoBancoDeDados, "banco.db");
    
    var retorno = await openDatabase(
      localBancoDeDados,
      version: 1,
      onCreate: (db, dbVersaoRecente){
        String sql = "CREATE TABLE tb_usuarios("
                        "id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,"
                        "nome VARCHAR,"
                        "idade INTEGER"
                        ")";
        db.execute(sql);
      }
    );

    print("aberto: " + retorno.isOpen.toString());

  }

  @override
  Widget build(BuildContext context) {
    _recuperarBancoDeDados();
    return Container();
  }
}
