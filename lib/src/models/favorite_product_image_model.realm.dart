// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_image_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteProductImageModel extends $FavoriteProductImageModel
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteProductImageModel(
    String id,
    String productId, {
    String? path,
    String? pathSmall,
    String? url,
    String? urlSmall,
    String? createdAt,
    String? updatedAt,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'productId', productId);
    RealmObjectBase.set(this, 'path', path);
    RealmObjectBase.set(this, 'pathSmall', pathSmall);
    RealmObjectBase.set(this, 'url', url);
    RealmObjectBase.set(this, 'urlSmall', urlSmall);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'updatedAt', updatedAt);
  }

  FavoriteProductImageModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  String get productId =>
      RealmObjectBase.get<String>(this, 'productId') as String;
  @override
  set productId(String value) => throw RealmUnsupportedSetError();

  @override
  String? get path => RealmObjectBase.get<String>(this, 'path') as String?;
  @override
  set path(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get pathSmall =>
      RealmObjectBase.get<String>(this, 'pathSmall') as String?;
  @override
  set pathSmall(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get url => RealmObjectBase.get<String>(this, 'url') as String?;
  @override
  set url(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get urlSmall =>
      RealmObjectBase.get<String>(this, 'urlSmall') as String?;
  @override
  set urlSmall(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get createdAt =>
      RealmObjectBase.get<String>(this, 'createdAt') as String?;
  @override
  set createdAt(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get updatedAt =>
      RealmObjectBase.get<String>(this, 'updatedAt') as String?;
  @override
  set updatedAt(String? value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<FavoriteProductImageModel>> get changes =>
      RealmObjectBase.getChanges<FavoriteProductImageModel>(this);

  @override
  Stream<RealmObjectChanges<FavoriteProductImageModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavoriteProductImageModel>(this, keyPaths);

  @override
  FavoriteProductImageModel freeze() =>
      RealmObjectBase.freezeObject<FavoriteProductImageModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'productId': productId.toEJson(),
      'path': path.toEJson(),
      'pathSmall': pathSmall.toEJson(),
      'url': url.toEJson(),
      'urlSmall': urlSmall.toEJson(),
      'createdAt': createdAt.toEJson(),
      'updatedAt': updatedAt.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteProductImageModel value) =>
      value.toEJson();
  static FavoriteProductImageModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'productId': EJsonValue productId,
        'path': EJsonValue path,
        'pathSmall': EJsonValue pathSmall,
        'url': EJsonValue url,
        'urlSmall': EJsonValue urlSmall,
        'createdAt': EJsonValue createdAt,
        'updatedAt': EJsonValue updatedAt,
      } =>
        FavoriteProductImageModel(
          fromEJson(id),
          fromEJson(productId),
          path: fromEJson(path),
          pathSmall: fromEJson(pathSmall),
          url: fromEJson(url),
          urlSmall: fromEJson(urlSmall),
          createdAt: fromEJson(createdAt),
          updatedAt: fromEJson(updatedAt),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteProductImageModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, FavoriteProductImageModel,
        'FavoriteProductImageModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('productId', RealmPropertyType.string),
      SchemaProperty('path', RealmPropertyType.string, optional: true),
      SchemaProperty('pathSmall', RealmPropertyType.string, optional: true),
      SchemaProperty('url', RealmPropertyType.string, optional: true),
      SchemaProperty('urlSmall', RealmPropertyType.string, optional: true),
      SchemaProperty('createdAt', RealmPropertyType.string, optional: true),
      SchemaProperty('updatedAt', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
