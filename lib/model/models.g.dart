// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// SqfEntityGenerator
// **************************************************************************

//  These classes was generated by SqfEntity
//  Copyright (c) 2019, All rights reserved. Use of this source code is governed by a
//  Apache license that can be found in the LICENSE file.

//  To use these SqfEntity classes do following:
//  - import model.dart into where to use
//  - start typing ex:Fav.select()... (add a few filters with fluent methods)...(add orderBy/orderBydesc if you want)...
//  - and then just put end of filters / or end of only select()  toSingle() / or toList()
//  - you can select one or return List<yourObject> by your filters and orders
//  - also you can batch update or batch delete by using delete/update methods instead of tosingle/tolist methods
//    Enjoy.. Huseyin Tokpunar

// ignore_for_file:
// BEGIN TABLES
// Fav TABLE
class TableFav extends SqfEntityTableBase {
  TableFav() {
    // declare properties of EntityTable
    tableName = 'fav';
    primaryKeyName = 'id';
    primaryKeyType = PrimaryKeyType.integer_auto_incremental;
    useSoftDeleting = true;
    // when useSoftDeleting is true, creates a field named 'isDeleted' on the table, and set to '1' this field when item deleted (does not hard delete)

    // declare fields
    fields = [
      SqfEntityFieldBase('type', DbType.text, isNotNull: false),
      SqfEntityFieldBase('title', DbType.text, isNotNull: false),
      SqfEntityFieldBase('tag', DbType.text, isNotNull: false),
      SqfEntityFieldBase('url', DbType.text, isNotNull: false),
      SqfEntityFieldBase('create_at', DbType.datetime,
          isNotNull: false, minValue: DateTime.parse('1900-01-01')),
    ];
    super.init();
  }
  static SqfEntityTableBase _instance;
  static SqfEntityTableBase get getInstance {
    return _instance = _instance ?? TableFav();
  }
}
// END TABLES

// BEGIN DATABASE MODEL
class FavoriteDbModel extends SqfEntityModelProvider {
  FavoriteDbModel() {
    databaseName = favoriteDbModel.databaseName;
    password = favoriteDbModel.password;
    dbVersion = favoriteDbModel.dbVersion;
    databaseTables = [
      TableFav.getInstance,
    ];

    bundledDatabasePath = favoriteDbModel
        .bundledDatabasePath; //'assets/sample.db'; // This value is optional. When bundledDatabasePath is empty then EntityBase creats a new database when initializing the database
  }
  Map<String, dynamic> getControllers() {
    final controllers = <String, dynamic>{};

    return controllers;
  }
}
// END DATABASE MODEL

// BEGIN ENTITIES
// region Fav
class Fav {
  Fav(
      {this.id,
      this.type,
      this.title,
      this.tag,
      this.url,
      this.create_at,
      this.isDeleted}) {
    _setDefaultValues();
  }
  Fav.withFields(this.type, this.title, this.tag, this.url, this.create_at,
      this.isDeleted) {
    _setDefaultValues();
  }
  Fav.withId(this.id, this.type, this.title, this.tag, this.url, this.create_at,
      this.isDeleted) {
    _setDefaultValues();
  }
  Fav.fromMap(Map<String, dynamic> o, {bool setDefaultValues = true}) {
    if (setDefaultValues) {
      _setDefaultValues();
    }
    id = int.tryParse(o['id'].toString());
    if (o['type'] != null) {
      type = o['type'] as String;
    }
    if (o['title'] != null) {
      title = o['title'] as String;
    }
    if (o['tag'] != null) {
      tag = o['tag'] as String;
    }
    if (o['url'] != null) {
      url = o['url'] as String;
    }
    if (o['create_at'] != null) {
      create_at = int.tryParse(o['create_at'].toString()) != null
          ? DateTime.fromMillisecondsSinceEpoch(
              int.tryParse(o['create_at'].toString()))
          : DateTime.tryParse(o['create_at'].toString());
    }
    isDeleted = o['isDeleted'] != null
        ? o['isDeleted'] == 1 || o['isDeleted'] == true
        : null;
  }
  // FIELDS (Fav)
  int id;
  String type;
  String title;
  String tag;
  String url;
  DateTime create_at;
  bool isDeleted;

  BoolResult saveResult;
  // end FIELDS (Fav)

  static const bool _softDeleteActivated = true;
  FavManager __mnFav;

  FavManager get _mnFav {
    return __mnFav = __mnFav ?? FavManager();
  }

  // METHODS
  Map<String, dynamic> toMap(
      {bool forQuery = false, bool forJson = false, bool forView = false}) {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (type != null) {
      map['type'] = type;
    }

    if (title != null) {
      map['title'] = title;
    }

    if (tag != null) {
      map['tag'] = tag;
    }

    if (url != null) {
      map['url'] = url;
    }

    if (create_at != null) {
      map['create_at'] = forJson
          ? create_at.toString()
          : forQuery ? create_at.millisecondsSinceEpoch : create_at;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  Future<Map<String, dynamic>> toMapWithChildren(
      [bool forQuery = false,
      bool forJson = false,
      bool forView = false]) async {
    final map = <String, dynamic>{};
    if (id != null) {
      map['id'] = id;
    }
    if (type != null) {
      map['type'] = type;
    }

    if (title != null) {
      map['title'] = title;
    }

    if (tag != null) {
      map['tag'] = tag;
    }

    if (url != null) {
      map['url'] = url;
    }

    if (create_at != null) {
      map['create_at'] = forJson
          ? create_at.toString()
          : forQuery ? create_at.millisecondsSinceEpoch : create_at;
    }

    if (isDeleted != null) {
      map['isDeleted'] = forQuery ? (isDeleted ? 1 : 0) : isDeleted;
    }

    return map;
  }

  /// This method returns Json String
  String toJson() {
    return json.encode(toMap(forJson: true));
  }

  /// This method returns Json String
  Future<String> toJsonWithChilds() async {
    return json.encode(await toMapWithChildren(false, true));
  }

  List<dynamic> toArgs() {
    return [
      type,
      title,
      tag,
      url,
      create_at != null ? create_at.millisecondsSinceEpoch : null,
      isDeleted
    ];
  }

  List<dynamic> toArgsWithIds() {
    return [
      id,
      type,
      title,
      tag,
      url,
      create_at != null ? create_at.millisecondsSinceEpoch : null,
      isDeleted
    ];
  }

  static Future<List<Fav>> fromWebUrl(String url) async {
    try {
      final response = await http.get(url);
      return await fromJson(response.body);
    } catch (e) {
      print('SQFENTITY ERROR Fav.fromWebUrl: ErrorMessage: ${e.toString()}');
      return null;
    }
  }

  static Future<List<Fav>> fromJson(String jsonBody) async {
    final Iterable list = await json.decode(jsonBody) as Iterable;
    var objList = <Fav>[];
    try {
      objList =
          list.map((fav) => Fav.fromMap(fav as Map<String, dynamic>)).toList();
    } catch (e) {
      print('SQFENTITY ERROR Fav.fromJson: ErrorMessage: ${e.toString()}');
    }
    return objList;
  }

  static Future<List<Fav>> fromMapList(List<dynamic> data,
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields,
      bool setDefaultValues = true}) async {
    final List<Fav> objList = <Fav>[];
    loadedFields = loadedFields ?? [];
    for (final map in data) {
      final obj = Fav.fromMap(map as Map<String, dynamic>,
          setDefaultValues: setDefaultValues);

      objList.add(obj);
    }
    return objList;
  }

  /// returns Fav by ID if exist, otherwise returns null
  ///
  /// Primary Keys: int id
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: getById(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: getById(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>returns Fav if exist, otherwise returns null
  Future<Fav> getById(int id,
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields}) async {
    if (id == null) {
      return null;
    }
    Fav obj;
    final data = await _mnFav.getById([id]);
    if (data.length != 0) {
      obj = Fav.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// Saves the (Fav) object. If the id field is null, saves as a new record and returns new id, if id is not null then updates record

  /// <returns>Returns id
  Future<int> save() async {
    if (id == null || id == 0) {
      id = await _mnFav.insert(this);
    } else {
      // id= await _upsert(); // removed in sqfentity_gen 1.3.0+6
      await _mnFav.update(this);
    }

    return id;
  }

  /// saveAs Fav. Returns a new Primary Key value of Fav

  /// <returns>Returns a new Primary Key value of Fav
  Future<int> saveAs() async {
    id = null;

    return save();
  }

  /// saveAll method saves the sent List<Fav> as a bulk in one transaction
  ///
  /// Returns a <List<BoolResult>>
  Future<List<dynamic>> saveAll(List<Fav> favs) async {
    // final results = _mnFav.saveAll('INSERT OR REPLACE INTO fav (id,type, title, tag, url, create_at,isDeleted)  VALUES (?,?,?,?,?,?,?)',favs);
    // return results; removed in sqfentity_gen 1.3.0+6
    FavoriteDbModel().batchStart();
    for (final obj in favs) {
      await obj.save();
    }
    return FavoriteDbModel().batchCommit();
  }

  /// Updates if the record exists, otherwise adds a new row

  /// <returns>Returns id
  Future<int> upsert() async {
    try {
      if (await _mnFav.rawInsert(
              'INSERT OR REPLACE INTO fav (id,type, title, tag, url, create_at,isDeleted)  VALUES (?,?,?,?,?,?,?)',
              [
                id,
                type,
                title,
                tag,
                url,
                create_at != null ? create_at.millisecondsSinceEpoch : null,
                isDeleted
              ]) ==
          1) {
        saveResult = BoolResult(
            success: true, successMessage: 'Fav id=$id updated successfully');
      } else {
        saveResult = BoolResult(
            success: false, errorMessage: 'Fav id=$id did not update');
      }
      return id;
    } catch (e) {
      saveResult = BoolResult(
          success: false,
          errorMessage: 'Fav Save failed. Error: ${e.toString()}');
      return 0;
    }
  }

  /// inserts or replaces the sent List<<Fav>> as a bulk in one transaction.
  ///
  /// upsertAll() method is faster then saveAll() method. upsertAll() should be used when you are sure that the primary key is greater than zero
  ///
  /// Returns a BoolCommitResult
  Future<BoolCommitResult> upsertAll(List<Fav> favs) async {
    final results = await _mnFav.rawInsertAll(
        'INSERT OR REPLACE INTO fav (id,type, title, tag, url, create_at,isDeleted)  VALUES (?,?,?,?,?,?,?)',
        favs);
    return results;
  }

  /// Deletes Fav

  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    print('SQFENTITIY: delete Fav invoked (id=$id)');
    if (!_softDeleteActivated || hardDelete || isDeleted) {
      return _mnFav
          .delete(QueryParams(whereString: 'id=?', whereArguments: [id]));
    } else {
      return _mnFav.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 1});
    }
  }

  /// Recover Fav>

  /// <returns>BoolResult res.success=Recovered, not res.success=Can not recovered
  Future<BoolResult> recover([bool recoverChilds = true]) async {
    print('SQFENTITIY: recover Fav invoked (id=$id)');
    {
      return _mnFav.updateBatch(
          QueryParams(whereString: 'id=?', whereArguments: [id]),
          {'isDeleted': 0});
    }
  }

  FavFilterBuilder select({List<String> columnsToSelect, bool getIsDeleted}) {
    return FavFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect;
  }

  FavFilterBuilder distinct({List<String> columnsToSelect, bool getIsDeleted}) {
    return FavFilterBuilder(this)
      .._getIsDeleted = getIsDeleted == true
      ..qparams.selectColumns = columnsToSelect
      ..qparams.distinct = true;
  }

  void _setDefaultValues() {
    isDeleted = isDeleted ?? false;
  }
  // END METHODS
  // CUSTOM CODES
  /*
      you must define customCode property of your SqfEntityTable constant for ex:
      const tablePerson = SqfEntityTable(
      tableName: 'person',
      primaryKeyName: 'id',
      primaryKeyType: PrimaryKeyType.integer_auto_incremental,
      fields: [
        SqfEntityField('firstName', DbType.text),
        SqfEntityField('lastName', DbType.text),
      ],
      customCode: '''
       String fullName()
       { 
         return '$firstName $lastName';
       }
      ''');
     */
  // END CUSTOM CODES
}
// endregion fav

// region FavField
class FavField extends SearchCriteria {
  FavField(this.favFB) {
    param = DbParameter();
  }
  DbParameter param;
  String _waitingNot = '';
  FavFilterBuilder favFB;

  FavField get not {
    _waitingNot = ' NOT ';
    return this;
  }

  FavFilterBuilder equals(dynamic pValue) {
    param.expression = '=';
    favFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, favFB.parameters, param, SqlSyntax.EQuals,
            favFB._addedBlocks)
        : setCriteria(pValue, favFB.parameters, param, SqlSyntax.NotEQuals,
            favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder equalsOrNull(dynamic pValue) {
    param.expression = '=';
    favFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, favFB.parameters, param, SqlSyntax.EQualsOrNull,
            favFB._addedBlocks)
        : setCriteria(pValue, favFB.parameters, param,
            SqlSyntax.NotEQualsOrNull, favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder isNull() {
    favFB._addedBlocks = setCriteria(
        0,
        favFB.parameters,
        param,
        SqlSyntax.IsNULL.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder contains(dynamic pValue) {
    if (pValue != null) {
      favFB._addedBlocks = setCriteria(
          '%${pValue.toString()}%',
          favFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          favFB._addedBlocks);
      _waitingNot = '';
      favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
          favFB._addedBlocks.retVal;
    }
    return favFB;
  }

  FavFilterBuilder startsWith(dynamic pValue) {
    if (pValue != null) {
      favFB._addedBlocks = setCriteria(
          '${pValue.toString()}%',
          favFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          favFB._addedBlocks);
      _waitingNot = '';
      favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
          favFB._addedBlocks.retVal;
      favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
          favFB._addedBlocks.retVal;
    }
    return favFB;
  }

  FavFilterBuilder endsWith(dynamic pValue) {
    if (pValue != null) {
      favFB._addedBlocks = setCriteria(
          '%${pValue.toString()}',
          favFB.parameters,
          param,
          SqlSyntax.Contains.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          favFB._addedBlocks);
      _waitingNot = '';
      favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
          favFB._addedBlocks.retVal;
    }
    return favFB;
  }

  FavFilterBuilder between(dynamic pFirst, dynamic pLast) {
    if (pFirst != null && pLast != null) {
      favFB._addedBlocks = setCriteria(
          pFirst,
          favFB.parameters,
          param,
          SqlSyntax.Between.replaceAll(SqlSyntax.notKeyword, _waitingNot),
          favFB._addedBlocks,
          pLast);
    } else if (pFirst != null) {
      if (_waitingNot != '') {
        favFB._addedBlocks = setCriteria(pFirst, favFB.parameters, param,
            SqlSyntax.LessThan, favFB._addedBlocks);
      } else {
        favFB._addedBlocks = setCriteria(pFirst, favFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, favFB._addedBlocks);
      }
    } else if (pLast != null) {
      if (_waitingNot != '') {
        favFB._addedBlocks = setCriteria(pLast, favFB.parameters, param,
            SqlSyntax.GreaterThan, favFB._addedBlocks);
      } else {
        favFB._addedBlocks = setCriteria(pLast, favFB.parameters, param,
            SqlSyntax.LessThanOrEquals, favFB._addedBlocks);
      }
    }
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder greaterThan(dynamic pValue) {
    param.expression = '>';
    favFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, favFB.parameters, param, SqlSyntax.GreaterThan,
            favFB._addedBlocks)
        : setCriteria(pValue, favFB.parameters, param,
            SqlSyntax.LessThanOrEquals, favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder lessThan(dynamic pValue) {
    param.expression = '<';
    favFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, favFB.parameters, param, SqlSyntax.LessThan,
            favFB._addedBlocks)
        : setCriteria(pValue, favFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder greaterThanOrEquals(dynamic pValue) {
    param.expression = '>=';
    favFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, favFB.parameters, param,
            SqlSyntax.GreaterThanOrEquals, favFB._addedBlocks)
        : setCriteria(pValue, favFB.parameters, param, SqlSyntax.LessThan,
            favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder lessThanOrEquals(dynamic pValue) {
    param.expression = '<=';
    favFB._addedBlocks = _waitingNot == ''
        ? setCriteria(pValue, favFB.parameters, param,
            SqlSyntax.LessThanOrEquals, favFB._addedBlocks)
        : setCriteria(pValue, favFB.parameters, param, SqlSyntax.GreaterThan,
            favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }

  FavFilterBuilder inValues(dynamic pValue) {
    favFB._addedBlocks = setCriteria(
        pValue,
        favFB.parameters,
        param,
        SqlSyntax.IN.replaceAll(SqlSyntax.notKeyword, _waitingNot),
        favFB._addedBlocks);
    _waitingNot = '';
    favFB._addedBlocks.needEndBlock[favFB._blockIndex] =
        favFB._addedBlocks.retVal;
    return favFB;
  }
}
// endregion FavField

// region FavFilterBuilder
class FavFilterBuilder extends SearchCriteria {
  FavFilterBuilder(Fav obj) {
    whereString = '';
    qparams = QueryParams();
    parameters = <DbParameter>[];
    orderByList = <String>[];
    groupByList = <String>[];
    _addedBlocks = AddedBlocks(<bool>[], <bool>[]);
    _addedBlocks.needEndBlock.add(false);
    _addedBlocks.waitingStartBlock.add(false);
    _pagesize = 0;
    _page = 0;
    _obj = obj;
  }
  AddedBlocks _addedBlocks;
  int _blockIndex = 0;
  List<DbParameter> parameters;
  List<String> orderByList;
  Fav _obj;
  QueryParams qparams;
  int _pagesize;
  int _page;

  /// put the sql keyword 'AND'
  FavFilterBuilder get and {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' AND ';
    }
    return this;
  }

  /// put the sql keyword 'OR'
  FavFilterBuilder get or {
    if (parameters.isNotEmpty) {
      parameters[parameters.length - 1].wOperator = ' OR ';
    }
    return this;
  }

  /// open parentheses
  FavFilterBuilder get startBlock {
    _addedBlocks.waitingStartBlock.add(true);
    _addedBlocks.needEndBlock.add(false);
    _blockIndex++;
    if (_blockIndex > 1) {
      _addedBlocks.needEndBlock[_blockIndex - 1] = true;
    }
    return this;
  }

  /// String whereCriteria, write raw query without 'where' keyword. Like this: 'field1 like 'test%' and field2 = 3'
  FavFilterBuilder where(String whereCriteria, {dynamic parameterValue}) {
    if (whereCriteria != null && whereCriteria != '') {
      final DbParameter param =
          DbParameter(columnName: parameterValue == null ? null : '');
      _addedBlocks = setCriteria(parameterValue ?? 0, parameters, param,
          '($whereCriteria)', _addedBlocks);
      _addedBlocks.needEndBlock[_blockIndex] = _addedBlocks.retVal;
    }
    return this;
  }

  /// page = page number,
  ///
  /// pagesize = row(s) per page
  FavFilterBuilder page(int page, int pagesize) {
    if (page > 0) {
      _page = page;
    }
    if (pagesize > 0) {
      _pagesize = pagesize;
    }
    return this;
  }

  /// int count = LIMIT
  FavFilterBuilder top(int count) {
    if (count > 0) {
      _pagesize = count;
    }
    return this;
  }

  /// close parentheses
  FavFilterBuilder get endBlock {
    if (_addedBlocks.needEndBlock[_blockIndex]) {
      parameters[parameters.length - 1].whereString += ' ) ';
    }
    _addedBlocks.needEndBlock.removeAt(_blockIndex);
    _addedBlocks.waitingStartBlock.removeAt(_blockIndex);
    _blockIndex--;
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='name, date'
  ///
  /// Example 2: argFields = ['name', 'date']
  FavFilterBuilder orderBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add(argFields);
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s != '') {
            orderByList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  FavFilterBuilder orderByDesc(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        orderByList.add('$argFields desc ');
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s != '') {
            orderByList.add(' $s desc ');
          }
        }
      }
    }
    return this;
  }

  /// argFields might be String or List<String>.
  ///
  /// Example 1: argFields='field1, field2'
  ///
  /// Example 2: argFields = ['field1', 'field2']
  FavFilterBuilder groupBy(dynamic argFields) {
    if (argFields != null) {
      if (argFields is String) {
        groupByList.add(' $argFields ');
      } else {
        for (String s in argFields as List<String>) {
          if (s != null && s != '') {
            groupByList.add(' $s ');
          }
        }
      }
    }
    return this;
  }

  FavField setField(FavField field, String colName, DbType dbtype) {
    return FavField(this)
      ..param = DbParameter(
          dbType: dbtype,
          columnName: colName,
          wStartBlock: _addedBlocks.waitingStartBlock[_blockIndex]);
  }

  FavField _id;
  FavField get id {
    return _id = setField(_id, 'id', DbType.integer);
  }

  FavField _type;
  FavField get type {
    return _type = setField(_type, 'type', DbType.text);
  }

  FavField _title;
  FavField get title {
    return _title = setField(_title, 'title', DbType.text);
  }

  FavField _tag;
  FavField get tag {
    return _tag = setField(_tag, 'tag', DbType.text);
  }

  FavField _url;
  FavField get url {
    return _url = setField(_url, 'url', DbType.text);
  }

  FavField _create_at;
  FavField get create_at {
    return _create_at = setField(_create_at, 'create_at', DbType.datetime);
  }

  FavField _isDeleted;
  FavField get isDeleted {
    return _isDeleted = setField(_isDeleted, 'isDeleted', DbType.bool);
  }

  bool _getIsDeleted;

  void _buildParameters() {
    if (_page > 0 && _pagesize > 0) {
      qparams
        ..limit = _pagesize
        ..offset = (_page - 1) * _pagesize;
    } else {
      qparams
        ..limit = _pagesize
        ..offset = _page;
    }
    for (DbParameter param in parameters) {
      if (param.columnName != null) {
        if (param.value is List) {
          param.value = param.value
              .toString()
              .replaceAll('[', '')
              .replaceAll(']', '')
              .toString();
          whereString += param.whereString
              .replaceAll('{field}', param.columnName)
              .replaceAll(
                  '?',
                  param.value is String
                      ? '\'${param.value.toString()}\''
                      : param.value.toString());
          param.value = null;
        } else {
          whereString +=
              param.whereString.replaceAll('{field}', param.columnName);
        }
        if (!param.whereString.contains('?')) {
        } else {
          switch (param.dbType) {
            case DbType.bool:
              param.value =
                  param.value == null ? null : param.value == true ? 1 : 0;
              param.value2 =
                  param.value2 == null ? null : param.value2 == true ? 1 : 0;
              break;
            case DbType.date:
            case DbType.datetime:
            case DbType.datetimeUtc:
              param.value = param.value == null
                  ? null
                  : (param.value as DateTime).millisecondsSinceEpoch;
              param.value2 = param.value2 == null
                  ? null
                  : (param.value2 as DateTime).millisecondsSinceEpoch;
              break;
            default:
          }
          if (param.value != null) {
            whereArguments.add(param.value);
          }
          if (param.value2 != null) {
            whereArguments.add(param.value2);
          }
        }
      } else {
        whereString += param.whereString;
      }
    }
    if (Fav._softDeleteActivated) {
      if (whereString != '') {
        whereString =
            '${!_getIsDeleted ? 'ifnull(isDeleted,0)=0 AND' : ''} ($whereString)';
      } else if (!_getIsDeleted) {
        whereString = 'ifnull(isDeleted,0)=0';
      }
    }

    if (whereString != '') {
      qparams.whereString = whereString;
    }
    qparams
      ..whereArguments = whereArguments
      ..groupBy = groupByList.join(',')
      ..orderBy = orderByList.join(',');
  }

  /// Deletes List<Fav> bulk by query
  ///
  /// <returns>BoolResult res.success=Deleted, not res.success=Can not deleted
  Future<BoolResult> delete([bool hardDelete = false]) async {
    _buildParameters();
    var r = BoolResult();

    if (Fav._softDeleteActivated && !hardDelete) {
      r = await _obj._mnFav.updateBatch(qparams, {'isDeleted': 1});
    } else {
      r = await _obj._mnFav.delete(qparams);
    }
    return r;
  }

  /// Recover List<Fav> bulk by query
  Future<BoolResult> recover() async {
    _getIsDeleted = true;
    _buildParameters();
    print('SQFENTITIY: recover Fav bulk invoked');
    return _obj._mnFav.updateBatch(qparams, {'isDeleted': 0});
  }

  /// using:
  ///
  /// update({'fieldName': Value})
  ///
  /// fieldName must be String. Value is dynamic, it can be any of the (int, bool, String.. )
  Future<BoolResult> update(Map<String, dynamic> values) {
    _buildParameters();
    if (qparams.limit > 0 || qparams.offset > 0) {
      qparams.whereString =
          'id IN (SELECT id from fav ${qparams.whereString.isNotEmpty ? 'WHERE ${qparams.whereString}' : ''}${qparams.limit > 0 ? ' LIMIT ${qparams.limit}' : ''}${qparams.offset > 0 ? ' OFFSET ${qparams.offset}' : ''})';
    }
    return _obj._mnFav.updateBatch(qparams, values);
  }

  /// This method always returns Fav Obj if exist, otherwise returns null
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toSingle(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toSingle(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Fav>
  Future<Fav> toSingle(
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields}) async {
    _pagesize = 1;
    _buildParameters();
    final objFuture = _obj._mnFav.toList(qparams);
    final data = await objFuture;
    Fav obj;
    if (data.isNotEmpty) {
      obj = Fav.fromMap(data[0] as Map<String, dynamic>);
    } else {
      obj = null;
    }
    return obj;
  }

  /// This method returns int.
  ///
  /// <returns>int
  Future<int> toCount([VoidCallback Function(int c) favCount]) async {
    _buildParameters();
    qparams.selectColumns = ['COUNT(1) AS CNT'];
    final favsFuture = await _obj._mnFav.toList(qparams);
    final int count = favsFuture[0]['CNT'] as int;
    if (favCount != null) {
      favCount(count);
    }
    return count;
  }

  /// This method returns List<Fav>.
  ///
  /// bool preload: if true, loads all related child objects (Set preload to true if you want to load all fields related to child or parent)
  ///
  /// ex: toList(preload:true) -> Loads all related objects
  ///
  /// List<String> preloadFields: specify the fields you want to preload (preload parameter's value should also be "true")
  ///
  /// ex: toList(preload:true, preloadFields:['plField1','plField2'... etc])  -> Loads only certain fields what you specified
  ///
  /// bool loadParents: if true, loads all parent objects until the object has no parent

  ///
  /// <returns>List<Fav>
  Future<List<Fav>> toList(
      {bool preload = false,
      List<String> preloadFields,
      bool loadParents = false,
      List<String> loadedFields}) async {
    final data = await toMapList();
    final List<Fav> favsData = await Fav.fromMapList(data,
        preload: preload,
        preloadFields: preloadFields,
        loadParents: loadParents,
        loadedFields: loadedFields,
        setDefaultValues: qparams.selectColumns == null);
    return favsData;
  }

  /// This method returns Json String
  Future<String> toJson() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(o.toMap(forJson: true));
    }
    return json.encode(list);
  }

  /// This method returns Json String.
  Future<String> toJsonWithChilds() async {
    final list = <dynamic>[];
    final data = await toList();
    for (var o in data) {
      list.add(await o.toMapWithChildren(false, true));
    }
    return json.encode(list);
  }

  /// This method returns List<dynamic>.
  ///
  /// <returns>List<dynamic>
  Future<List<dynamic>> toMapList() async {
    _buildParameters();
    return await _obj._mnFav.toList(qparams);
  }

  /// This method returns Primary Key List<int>.
  /// <returns>List<int>
  Future<List<int>> toListPrimaryKey([bool buildParameters = true]) async {
    if (buildParameters) {
      _buildParameters();
    }
    final List<int> idData = <int>[];
    qparams.selectColumns = ['id'];
    final idFuture = await _obj._mnFav.toList(qparams);

    final int count = idFuture.length;
    for (int i = 0; i < count; i++) {
      idData.add(idFuture[i]['id'] as int);
    }
    return idData;
  }

  /// Returns List<dynamic> for selected columns. Use this method for 'groupBy' with min,max,avg..
  ///
  /// Sample usage: (see EXAMPLE 4.2 at https://github.com/hhtokpinar/sqfEntity#group-by)
  Future<List<dynamic>> toListObject() async {
    _buildParameters();

    final objectFuture = _obj._mnFav.toList(qparams);

    final List<dynamic> objectsData = <dynamic>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i]);
    }
    return objectsData;
  }

  /// Returns List<String> for selected first column
  ///
  /// Sample usage: await Fav.select(columnsToSelect: ['columnName']).toListString()
  Future<List<String>> toListString(
      [VoidCallback Function(List<String> o) listString]) async {
    _buildParameters();

    final objectFuture = _obj._mnFav.toList(qparams);

    final List<String> objectsData = <String>[];
    final data = await objectFuture;
    final int count = data.length;
    for (int i = 0; i < count; i++) {
      objectsData.add(data[i][qparams.selectColumns[0]].toString());
    }
    if (listString != null) {
      listString(objectsData);
    }
    return objectsData;
  }
}
// endregion FavFilterBuilder

// region FavFields
class FavFields {
  static TableField _fId;
  static TableField get id {
    return _fId = _fId ?? SqlSyntax.setField(_fId, 'id', DbType.integer);
  }

  static TableField _fType;
  static TableField get type {
    return _fType = _fType ?? SqlSyntax.setField(_fType, 'type', DbType.text);
  }

  static TableField _fTitle;
  static TableField get title {
    return _fTitle =
        _fTitle ?? SqlSyntax.setField(_fTitle, 'title', DbType.text);
  }

  static TableField _fTag;
  static TableField get tag {
    return _fTag = _fTag ?? SqlSyntax.setField(_fTag, 'tag', DbType.text);
  }

  static TableField _fUrl;
  static TableField get url {
    return _fUrl = _fUrl ?? SqlSyntax.setField(_fUrl, 'url', DbType.text);
  }

  static TableField _fCreate_at;
  static TableField get create_at {
    return _fCreate_at = _fCreate_at ??
        SqlSyntax.setField(_fCreate_at, 'create_at', DbType.datetime);
  }

  static TableField _fIsDeleted;
  static TableField get isDeleted {
    return _fIsDeleted = _fIsDeleted ??
        SqlSyntax.setField(_fIsDeleted, 'isDeleted', DbType.integer);
  }
}
// endregion FavFields

//region FavManager
class FavManager extends SqfEntityProvider {
  FavManager()
      : super(FavoriteDbModel(),
            tableName: _tableName,
            primaryKeyList: _primaryKeyList,
            whereStr: _whereStr);
  static final String _tableName = 'fav';
  static final List<String> _primaryKeyList = ['id'];
  static final String _whereStr = 'id=?';
}

//endregion FavManager
class FavoriteDbModelSequenceManager extends SqfEntityProvider {
  FavoriteDbModelSequenceManager() : super(FavoriteDbModel());
}
// END OF ENTITIES