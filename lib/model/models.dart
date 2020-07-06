import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'models.g.dart';

@SqfEntityBuilder(favoriteDbModel)
const favoriteDbModel = SqfEntityModel(
    modelName: 'favoriteDbModel', // optional
    databaseName: 'favoriteDbModel.db',
    databaseTables: [fav],
    bundledDatabasePath: null);

const fav = SqfEntityTable(
    tableName: 'fav',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('type', DbType.text),
      SqfEntityField('title', DbType.text),
      SqfEntityField('tag', DbType.text),
      SqfEntityField('url', DbType.text),
      SqfEntityField('create_at', DbType.datetime),
    ]);
