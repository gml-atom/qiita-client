import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'history_models.g.dart';

@SqfEntityBuilder(historyDbModel)
const historyDbModel = SqfEntityModel(
    modelName: 'historyDbModel', // optional
    databaseName: 'historyDbModel.db',
    databaseTables: [history],
    bundledDatabasePath: null);

const history = SqfEntityTable(
    tableName: 'history',
    primaryKeyName: 'id',
    primaryKeyType: PrimaryKeyType.integer_auto_incremental,
    useSoftDeleting: true,
    fields: [
      SqfEntityField('title', DbType.text),
      SqfEntityField('url', DbType.text),
      SqfEntityField('num', DbType.integer),
      SqfEntityField('create_at', DbType.datetime),
    ]);
