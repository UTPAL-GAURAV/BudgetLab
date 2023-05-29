// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'BudgetModule/Budgets/Budget/budget_entity.dart';
import 'BudgetModule/Budgets/Category/category_entity.dart';
import 'BudgetModule/IncomeExpense/incomeExpense_entity.dart';
import 'BudgetModule/LoanLend/loanLend_entity.dart';
import 'BudgetModule/Savings/saings_entity.dart';
import 'SettingsModule/metadata_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 3912639388013938141),
      name: 'Budget',
      lastPropertyId: const IdUid(3, 2295571132967557559),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 5089663918438219010),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7117724927169584856),
            name: 'repeats',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2295571132967557559),
            name: 'amount',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(2, 1588695050128735560),
      name: 'Category',
      lastPropertyId: const IdUid(4, 3292258396681020156),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 4169513893214613262),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2752402896608338538),
            name: 'isExpense',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2832366461472518905),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3292258396681020156),
            name: 'icon',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(3, 1358053335749135773),
      name: 'IncomeExpense',
      lastPropertyId: const IdUid(6, 5580495707262040883),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7685506308775661417),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7430617893173994657),
            name: 'isIncome',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 8772035493217625258),
            name: 'dateTime',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3433267797551436833),
            name: 'amount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8378074971595057259),
            name: 'note',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 5580495707262040883),
            name: 'category',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(4, 9052435534381775407),
      name: 'LoanLend',
      lastPropertyId: const IdUid(10, 83039039708730487),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2062997448433781121),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3324376512030445888),
            name: 'isLoan',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 4028527212899484197),
            name: 'dateTime',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2845511107751879036),
            name: 'dateOfReturn',
            type: 10,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7572490216904874117),
            name: 'amount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 472858004322395733),
            name: 'note',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 8637945009649281167),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 8499334383457211072),
            name: 'returnStatus',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 2156790177571280887),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 83039039708730487),
            name: 'genderEmoji',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(5, 3071978227778497905),
      name: 'Metadata',
      lastPropertyId: const IdUid(10, 5205876471603607160),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3918733605684651353),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 6529066406702624820),
            name: 'currentBalance',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 7525627846413658126),
            name: 'yourWorth',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 2882924185126059228),
            name: 'userName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1538656536889066998),
            name: 'currency',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 1530149613637301564),
            name: 'country',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 7731241619166360903),
            name: 'countryCode',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 7650055383835823745),
            name: 'password',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 5402709417376191570),
            name: 'hideOn',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 5205876471603607160),
            name: 'readMessage',
            type: 1,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[]),
  ModelEntity(
      id: const IdUid(6, 5953722859783493972),
      name: 'Savings',
      lastPropertyId: const IdUid(5, 5271227194289515064),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1975492489271444302),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 2945359868757435183),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 2768477032845607697),
            name: 'targetAmount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3986030090361302007),
            name: 'savedAmount',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 5271227194289515064),
            name: 'icon',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(6, 5953722859783493972),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Budget: EntityDefinition<Budget>(
        model: _entities[0],
        toOneRelations: (Budget object) => [],
        toManyRelations: (Budget object) => {},
        getId: (Budget object) => object.id,
        setId: (Budget object, int id) {
          object.id = id;
        },
        objectToFB: (Budget object, fb.Builder fbb) {
          final repeatsOffset = fbb.writeString(object.repeats);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, repeatsOffset);
          fbb.addInt64(2, object.amount);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Budget(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              repeats: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              amount:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0));

          return object;
        }),
    Category: EntityDefinition<Category>(
        model: _entities[1],
        toOneRelations: (Category object) => [],
        toManyRelations: (Category object) => {},
        getId: (Category object) => object.id,
        setId: (Category object, int id) {
          object.id = id;
        },
        objectToFB: (Category object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final iconOffset = fbb.writeString(object.icon);
          fbb.startTable(5);
          fbb.addInt64(0, object.id);
          fbb.addBool(1, object.isExpense);
          fbb.addOffset(2, nameOffset);
          fbb.addOffset(3, iconOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Category(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              isExpense:
                  const fb.BoolReader().vTableGet(buffer, rootOffset, 6, false),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              icon: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''));

          return object;
        }),
    IncomeExpense: EntityDefinition<IncomeExpense>(
        model: _entities[2],
        toOneRelations: (IncomeExpense object) => [],
        toManyRelations: (IncomeExpense object) => {},
        getId: (IncomeExpense object) => object.id,
        setId: (IncomeExpense object, int id) {
          object.id = id;
        },
        objectToFB: (IncomeExpense object, fb.Builder fbb) {
          final noteOffset = fbb.writeString(object.note);
          final categoryOffset = fbb.writeString(object.category);
          fbb.startTable(7);
          fbb.addInt64(0, object.id);
          fbb.addBool(1, object.isIncome);
          fbb.addInt64(2, object.dateTime.millisecondsSinceEpoch);
          fbb.addInt64(3, object.amount);
          fbb.addOffset(4, noteOffset);
          fbb.addOffset(5, categoryOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = IncomeExpense(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              isIncome:
                  const fb.BoolReader().vTableGet(buffer, rootOffset, 6, false),
              dateTime: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)),
              amount:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              note: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              category: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''));

          return object;
        }),
    LoanLend: EntityDefinition<LoanLend>(
        model: _entities[3],
        toOneRelations: (LoanLend object) => [],
        toManyRelations: (LoanLend object) => {},
        getId: (LoanLend object) => object.id,
        setId: (LoanLend object, int id) {
          object.id = id;
        },
        objectToFB: (LoanLend object, fb.Builder fbb) {
          final noteOffset = fbb.writeString(object.note);
          final phoneOffset = fbb.writeString(object.phone);
          final returnStatusOffset = fbb.writeString(object.returnStatus);
          final nameOffset = fbb.writeString(object.name);
          final genderEmojiOffset = fbb.writeString(object.genderEmoji);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addBool(1, object.isLoan);
          fbb.addInt64(2, object.dateTime.millisecondsSinceEpoch);
          fbb.addInt64(3, object.dateOfReturn.millisecondsSinceEpoch);
          fbb.addInt64(4, object.amount);
          fbb.addOffset(5, noteOffset);
          fbb.addOffset(6, phoneOffset);
          fbb.addOffset(7, returnStatusOffset);
          fbb.addOffset(8, nameOffset);
          fbb.addOffset(9, genderEmojiOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = LoanLend(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              isLoan:
                  const fb.BoolReader().vTableGet(buffer, rootOffset, 6, false),
              dateTime: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0)),
              dateOfReturn: DateTime.fromMillisecondsSinceEpoch(
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0)),
              amount:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 20, ''),
              note: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              phone: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              returnStatus: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              genderEmoji: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 22, ''));

          return object;
        }),
    Metadata: EntityDefinition<Metadata>(
        model: _entities[4],
        toOneRelations: (Metadata object) => [],
        toManyRelations: (Metadata object) => {},
        getId: (Metadata object) => object.id,
        setId: (Metadata object, int id) {
          object.id = id;
        },
        objectToFB: (Metadata object, fb.Builder fbb) {
          final userNameOffset = fbb.writeString(object.userName);
          final currencyOffset = fbb.writeString(object.currency);
          final countryOffset = fbb.writeString(object.country);
          final passwordOffset = fbb.writeString(object.password);
          fbb.startTable(11);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.currentBalance);
          fbb.addInt64(2, object.yourWorth);
          fbb.addOffset(3, userNameOffset);
          fbb.addOffset(4, currencyOffset);
          fbb.addOffset(5, countryOffset);
          fbb.addInt64(6, object.countryCode);
          fbb.addOffset(7, passwordOffset);
          fbb.addBool(8, object.hideOn);
          fbb.addBool(9, object.readMessage);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Metadata(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              currentBalance:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              yourWorth:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              userName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              currency: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              country: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              countryCode:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 16, 0),
              password: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              hideOn: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 20, false),
              readMessage: const fb.BoolReader()
                  .vTableGet(buffer, rootOffset, 22, false));

          return object;
        }),
    Savings: EntityDefinition<Savings>(
        model: _entities[5],
        toOneRelations: (Savings object) => [],
        toManyRelations: (Savings object) => {},
        getId: (Savings object) => object.id,
        setId: (Savings object, int id) {
          object.id = id;
        },
        objectToFB: (Savings object, fb.Builder fbb) {
          final titleOffset = fbb.writeString(object.title);
          final iconOffset = fbb.writeString(object.icon);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, titleOffset);
          fbb.addInt64(2, object.targetAmount);
          fbb.addInt64(3, object.savedAmount);
          fbb.addOffset(4, iconOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Savings(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              targetAmount:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              savedAmount:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              icon: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Budget] entity fields to define ObjectBox queries.
class Budget_ {
  /// see [Budget.id]
  static final id = QueryIntegerProperty<Budget>(_entities[0].properties[0]);

  /// see [Budget.repeats]
  static final repeats =
      QueryStringProperty<Budget>(_entities[0].properties[1]);

  /// see [Budget.amount]
  static final amount =
      QueryIntegerProperty<Budget>(_entities[0].properties[2]);
}

/// [Category] entity fields to define ObjectBox queries.
class Category_ {
  /// see [Category.id]
  static final id = QueryIntegerProperty<Category>(_entities[1].properties[0]);

  /// see [Category.isExpense]
  static final isExpense =
      QueryBooleanProperty<Category>(_entities[1].properties[1]);

  /// see [Category.name]
  static final name = QueryStringProperty<Category>(_entities[1].properties[2]);

  /// see [Category.icon]
  static final icon = QueryStringProperty<Category>(_entities[1].properties[3]);
}

/// [IncomeExpense] entity fields to define ObjectBox queries.
class IncomeExpense_ {
  /// see [IncomeExpense.id]
  static final id =
      QueryIntegerProperty<IncomeExpense>(_entities[2].properties[0]);

  /// see [IncomeExpense.isIncome]
  static final isIncome =
      QueryBooleanProperty<IncomeExpense>(_entities[2].properties[1]);

  /// see [IncomeExpense.dateTime]
  static final dateTime =
      QueryIntegerProperty<IncomeExpense>(_entities[2].properties[2]);

  /// see [IncomeExpense.amount]
  static final amount =
      QueryIntegerProperty<IncomeExpense>(_entities[2].properties[3]);

  /// see [IncomeExpense.note]
  static final note =
      QueryStringProperty<IncomeExpense>(_entities[2].properties[4]);

  /// see [IncomeExpense.category]
  static final category =
      QueryStringProperty<IncomeExpense>(_entities[2].properties[5]);
}

/// [LoanLend] entity fields to define ObjectBox queries.
class LoanLend_ {
  /// see [LoanLend.id]
  static final id = QueryIntegerProperty<LoanLend>(_entities[3].properties[0]);

  /// see [LoanLend.isLoan]
  static final isLoan =
      QueryBooleanProperty<LoanLend>(_entities[3].properties[1]);

  /// see [LoanLend.dateTime]
  static final dateTime =
      QueryIntegerProperty<LoanLend>(_entities[3].properties[2]);

  /// see [LoanLend.dateOfReturn]
  static final dateOfReturn =
      QueryIntegerProperty<LoanLend>(_entities[3].properties[3]);

  /// see [LoanLend.amount]
  static final amount =
      QueryIntegerProperty<LoanLend>(_entities[3].properties[4]);

  /// see [LoanLend.note]
  static final note = QueryStringProperty<LoanLend>(_entities[3].properties[5]);

  /// see [LoanLend.phone]
  static final phone =
      QueryStringProperty<LoanLend>(_entities[3].properties[6]);

  /// see [LoanLend.returnStatus]
  static final returnStatus =
      QueryStringProperty<LoanLend>(_entities[3].properties[7]);

  /// see [LoanLend.name]
  static final name = QueryStringProperty<LoanLend>(_entities[3].properties[8]);

  /// see [LoanLend.genderEmoji]
  static final genderEmoji =
      QueryStringProperty<LoanLend>(_entities[3].properties[9]);
}

/// [Metadata] entity fields to define ObjectBox queries.
class Metadata_ {
  /// see [Metadata.id]
  static final id = QueryIntegerProperty<Metadata>(_entities[4].properties[0]);

  /// see [Metadata.currentBalance]
  static final currentBalance =
      QueryIntegerProperty<Metadata>(_entities[4].properties[1]);

  /// see [Metadata.yourWorth]
  static final yourWorth =
      QueryIntegerProperty<Metadata>(_entities[4].properties[2]);

  /// see [Metadata.userName]
  static final userName =
      QueryStringProperty<Metadata>(_entities[4].properties[3]);

  /// see [Metadata.currency]
  static final currency =
      QueryStringProperty<Metadata>(_entities[4].properties[4]);

  /// see [Metadata.country]
  static final country =
      QueryStringProperty<Metadata>(_entities[4].properties[5]);

  /// see [Metadata.countryCode]
  static final countryCode =
      QueryIntegerProperty<Metadata>(_entities[4].properties[6]);

  /// see [Metadata.password]
  static final password =
      QueryStringProperty<Metadata>(_entities[4].properties[7]);

  /// see [Metadata.hideOn]
  static final hideOn =
      QueryBooleanProperty<Metadata>(_entities[4].properties[8]);

  /// see [Metadata.readMessage]
  static final readMessage =
      QueryBooleanProperty<Metadata>(_entities[4].properties[9]);
}

/// [Savings] entity fields to define ObjectBox queries.
class Savings_ {
  /// see [Savings.id]
  static final id = QueryIntegerProperty<Savings>(_entities[5].properties[0]);

  /// see [Savings.title]
  static final title = QueryStringProperty<Savings>(_entities[5].properties[1]);

  /// see [Savings.targetAmount]
  static final targetAmount =
      QueryIntegerProperty<Savings>(_entities[5].properties[2]);

  /// see [Savings.savedAmount]
  static final savedAmount =
      QueryIntegerProperty<Savings>(_entities[5].properties[3]);

  /// see [Savings.icon]
  static final icon = QueryStringProperty<Savings>(_entities[5].properties[4]);
}
