// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FavoriteProductModel extends _FavoriteProductModel
    with RealmEntity, RealmObjectBase, RealmObject {
  FavoriteProductModel(
    String id,
    String name,
    int price,
    int discountPrice, {
    Iterable<FavoriteProductImageModel> images = const [],
    String? description,
    String? returnTerms,
    String? ratingAverage,
    int? ratingCount,
    int? reviewCount,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'discountPrice', discountPrice);
    RealmObjectBase.set<RealmList<FavoriteProductImageModel>>(
        this, 'images', RealmList<FavoriteProductImageModel>(images));
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'returnTerms', returnTerms);
    RealmObjectBase.set(this, 'ratingAverage', ratingAverage);
    RealmObjectBase.set(this, 'ratingCount', ratingCount);
    RealmObjectBase.set(this, 'reviewCount', reviewCount);
  }

  FavoriteProductModel._();

  @override
  String get id => RealmObjectBase.get<String>(this, 'id') as String;
  @override
  set id(String value) => throw RealmUnsupportedSetError();

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => throw RealmUnsupportedSetError();

  @override
  int get price => RealmObjectBase.get<int>(this, 'price') as int;
  @override
  set price(int value) => throw RealmUnsupportedSetError();

  @override
  int get discountPrice =>
      RealmObjectBase.get<int>(this, 'discountPrice') as int;
  @override
  set discountPrice(int value) => throw RealmUnsupportedSetError();

  @override
  RealmList<FavoriteProductImageModel> get images =>
      RealmObjectBase.get<FavoriteProductImageModel>(this, 'images')
          as RealmList<FavoriteProductImageModel>;
  @override
  set images(covariant RealmList<FavoriteProductImageModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get returnTerms =>
      RealmObjectBase.get<String>(this, 'returnTerms') as String?;
  @override
  set returnTerms(String? value) => throw RealmUnsupportedSetError();

  @override
  String? get ratingAverage =>
      RealmObjectBase.get<String>(this, 'ratingAverage') as String?;
  @override
  set ratingAverage(String? value) => throw RealmUnsupportedSetError();

  @override
  int? get ratingCount => RealmObjectBase.get<int>(this, 'ratingCount') as int?;
  @override
  set ratingCount(int? value) => throw RealmUnsupportedSetError();

  @override
  int? get reviewCount => RealmObjectBase.get<int>(this, 'reviewCount') as int?;
  @override
  set reviewCount(int? value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<FavoriteProductModel>> get changes =>
      RealmObjectBase.getChanges<FavoriteProductModel>(this);

  @override
  Stream<RealmObjectChanges<FavoriteProductModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<FavoriteProductModel>(this, keyPaths);

  @override
  FavoriteProductModel freeze() =>
      RealmObjectBase.freezeObject<FavoriteProductModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'price': price.toEJson(),
      'discountPrice': discountPrice.toEJson(),
      'images': images.toEJson(),
      'description': description.toEJson(),
      'returnTerms': returnTerms.toEJson(),
      'ratingAverage': ratingAverage.toEJson(),
      'ratingCount': ratingCount.toEJson(),
      'reviewCount': reviewCount.toEJson(),
    };
  }

  static EJsonValue _toEJson(FavoriteProductModel value) => value.toEJson();
  static FavoriteProductModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'price': EJsonValue price,
        'discountPrice': EJsonValue discountPrice,
        'images': EJsonValue images,
        'description': EJsonValue description,
        'returnTerms': EJsonValue returnTerms,
        'ratingAverage': EJsonValue ratingAverage,
        'ratingCount': EJsonValue ratingCount,
        'reviewCount': EJsonValue reviewCount,
      } =>
        FavoriteProductModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(price),
          fromEJson(discountPrice),
          images: fromEJson(images),
          description: fromEJson(description),
          returnTerms: fromEJson(returnTerms),
          ratingAverage: fromEJson(ratingAverage),
          ratingCount: fromEJson(ratingCount),
          reviewCount: fromEJson(reviewCount),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(FavoriteProductModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, FavoriteProductModel, 'FavoriteProductModel', [
      SchemaProperty('id', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.int),
      SchemaProperty('discountPrice', RealmPropertyType.int),
      SchemaProperty('images', RealmPropertyType.object,
          linkTarget: 'FavoriteProductImageModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('returnTerms', RealmPropertyType.string, optional: true),
      SchemaProperty('ratingAverage', RealmPropertyType.string, optional: true),
      SchemaProperty('ratingCount', RealmPropertyType.int, optional: true),
      SchemaProperty('reviewCount', RealmPropertyType.int, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
