// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NoteDatabaseData extends DataClass
    implements Insertable<NoteDatabaseData> {
  final int? id;
  final String title;
  final String desc;
  NoteDatabaseData({this.id, required this.title, required this.desc});
  factory NoteDatabaseData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NoteDatabaseData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      desc: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desc'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['title'] = Variable<String>(title);
    map['desc'] = Variable<String>(desc);
    return map;
  }

  NoteDatabaseCompanion toCompanion(bool nullToAbsent) {
    return NoteDatabaseCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      desc: Value(desc),
    );
  }

  factory NoteDatabaseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NoteDatabaseData(
      id: serializer.fromJson<int?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      desc: serializer.fromJson<String>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'title': serializer.toJson<String>(title),
      'desc': serializer.toJson<String>(desc),
    };
  }

  NoteDatabaseData copyWith({int? id, String? title, String? desc}) =>
      NoteDatabaseData(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('NoteDatabaseData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteDatabaseData &&
          other.id == this.id &&
          other.title == this.title &&
          other.desc == this.desc);
}

class NoteDatabaseCompanion extends UpdateCompanion<NoteDatabaseData> {
  final Value<int?> id;
  final Value<String> title;
  final Value<String> desc;
  const NoteDatabaseCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.desc = const Value.absent(),
  });
  NoteDatabaseCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String desc,
  })  : title = Value(title),
        desc = Value(desc);
  static Insertable<NoteDatabaseData> custom({
    Expression<int?>? id,
    Expression<String>? title,
    Expression<String>? desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (desc != null) 'desc': desc,
    });
  }

  NoteDatabaseCompanion copyWith(
      {Value<int?>? id, Value<String>? title, Value<String>? desc}) {
    return NoteDatabaseCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteDatabaseCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

class $NoteDatabaseTable extends NoteDatabase
    with TableInfo<$NoteDatabaseTable, NoteDatabaseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteDatabaseTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String?> desc = GeneratedColumn<String?>(
      'desc', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, desc];
  @override
  String get aliasedName => _alias ?? 'note_database';
  @override
  String get actualTableName => 'note_database';
  @override
  VerificationContext validateIntegrity(Insertable<NoteDatabaseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    } else if (isInserting) {
      context.missing(_descMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteDatabaseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NoteDatabaseData.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NoteDatabaseTable createAlias(String alias) {
    return $NoteDatabaseTable(attachedDatabase, alias);
  }
}

abstract class _$NoteManager extends GeneratedDatabase {
  _$NoteManager(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NoteDatabaseTable noteDatabase = $NoteDatabaseTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noteDatabase];
}
