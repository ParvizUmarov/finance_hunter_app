// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TransactionTbTable extends TransactionTb
    with TableInfo<$TransactionTbTable, TransactionTbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _accountNameMeta = const VerificationMeta(
    'accountName',
  );
  @override
  late final GeneratedColumn<String> accountName = GeneratedColumn<String>(
    'account_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<String> balance = GeneratedColumn<String>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isIncomeMeta = const VerificationMeta(
    'isIncome',
  );
  @override
  late final GeneratedColumn<bool> isIncome = GeneratedColumn<bool>(
    'is_income',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_income" IN (0, 1))',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<String> transactionDate = GeneratedColumn<String>(
    'transaction_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncStateMeta = const VerificationMeta(
    'syncState',
  );
  @override
  late final GeneratedColumn<int> syncState = GeneratedColumn<int>(
    'sync_state',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    localId,
    accountId,
    accountName,
    balance,
    currency,
    categoryId,
    categoryName,
    emoji,
    isIncome,
    amount,
    transactionDate,
    comment,
    createdAt,
    updatedAt,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_tb';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionTbData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('account_name')) {
      context.handle(
        _accountNameMeta,
        accountName.isAcceptableOrUnknown(
          data['account_name']!,
          _accountNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accountNameMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('is_income')) {
      context.handle(
        _isIncomeMeta,
        isIncome.isAcceptableOrUnknown(data['is_income']!, _isIncomeMeta),
      );
    } else if (isInserting) {
      context.missing(_isIncomeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_state')) {
      context.handle(
        _syncStateMeta,
        syncState.isAcceptableOrUnknown(data['sync_state']!, _syncStateMeta),
      );
    } else if (isInserting) {
      context.missing(_syncStateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {localId};
  @override
  TransactionTbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionTbData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      ),
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      accountName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}account_name'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}balance'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      isIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_income'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_date'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
      syncState: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sync_state'],
      )!,
    );
  }

  @override
  $TransactionTbTable createAlias(String alias) {
    return $TransactionTbTable(attachedDatabase, alias);
  }
}

class TransactionTbData extends DataClass
    implements Insertable<TransactionTbData> {
  final int? id;
  final int localId;
  final int accountId;
  final String accountName;
  final String balance;
  final String currency;
  final int categoryId;
  final String categoryName;
  final String emoji;
  final bool isIncome;
  final String amount;
  final String transactionDate;
  final String? comment;
  final String createdAt;
  final String updatedAt;
  final int syncState;
  const TransactionTbData({
    this.id,
    required this.localId,
    required this.accountId,
    required this.accountName,
    required this.balance,
    required this.currency,
    required this.categoryId,
    required this.categoryName,
    required this.emoji,
    required this.isIncome,
    required this.amount,
    required this.transactionDate,
    this.comment,
    required this.createdAt,
    required this.updatedAt,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    map['local_id'] = Variable<int>(localId);
    map['account_id'] = Variable<int>(accountId);
    map['account_name'] = Variable<String>(accountName);
    map['balance'] = Variable<String>(balance);
    map['currency'] = Variable<String>(currency);
    map['category_id'] = Variable<int>(categoryId);
    map['category_name'] = Variable<String>(categoryName);
    map['emoji'] = Variable<String>(emoji);
    map['is_income'] = Variable<bool>(isIncome);
    map['amount'] = Variable<String>(amount);
    map['transaction_date'] = Variable<String>(transactionDate);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['sync_state'] = Variable<int>(syncState);
    return map;
  }

  TransactionTbCompanion toCompanion(bool nullToAbsent) {
    return TransactionTbCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      localId: Value(localId),
      accountId: Value(accountId),
      accountName: Value(accountName),
      balance: Value(balance),
      currency: Value(currency),
      categoryId: Value(categoryId),
      categoryName: Value(categoryName),
      emoji: Value(emoji),
      isIncome: Value(isIncome),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncState: Value(syncState),
    );
  }

  factory TransactionTbData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionTbData(
      id: serializer.fromJson<int?>(json['id']),
      localId: serializer.fromJson<int>(json['localId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      accountName: serializer.fromJson<String>(json['accountName']),
      balance: serializer.fromJson<String>(json['balance']),
      currency: serializer.fromJson<String>(json['currency']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      emoji: serializer.fromJson<String>(json['emoji']),
      isIncome: serializer.fromJson<bool>(json['isIncome']),
      amount: serializer.fromJson<String>(json['amount']),
      transactionDate: serializer.fromJson<String>(json['transactionDate']),
      comment: serializer.fromJson<String?>(json['comment']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      syncState: serializer.fromJson<int>(json['syncState']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'localId': serializer.toJson<int>(localId),
      'accountId': serializer.toJson<int>(accountId),
      'accountName': serializer.toJson<String>(accountName),
      'balance': serializer.toJson<String>(balance),
      'currency': serializer.toJson<String>(currency),
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryName': serializer.toJson<String>(categoryName),
      'emoji': serializer.toJson<String>(emoji),
      'isIncome': serializer.toJson<bool>(isIncome),
      'amount': serializer.toJson<String>(amount),
      'transactionDate': serializer.toJson<String>(transactionDate),
      'comment': serializer.toJson<String?>(comment),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'syncState': serializer.toJson<int>(syncState),
    };
  }

  TransactionTbData copyWith({
    Value<int?> id = const Value.absent(),
    int? localId,
    int? accountId,
    String? accountName,
    String? balance,
    String? currency,
    int? categoryId,
    String? categoryName,
    String? emoji,
    bool? isIncome,
    String? amount,
    String? transactionDate,
    Value<String?> comment = const Value.absent(),
    String? createdAt,
    String? updatedAt,
    int? syncState,
  }) => TransactionTbData(
    id: id.present ? id.value : this.id,
    localId: localId ?? this.localId,
    accountId: accountId ?? this.accountId,
    accountName: accountName ?? this.accountName,
    balance: balance ?? this.balance,
    currency: currency ?? this.currency,
    categoryId: categoryId ?? this.categoryId,
    categoryName: categoryName ?? this.categoryName,
    emoji: emoji ?? this.emoji,
    isIncome: isIncome ?? this.isIncome,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    comment: comment.present ? comment.value : this.comment,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncState: syncState ?? this.syncState,
  );
  TransactionTbData copyWithCompanion(TransactionTbCompanion data) {
    return TransactionTbData(
      id: data.id.present ? data.id.value : this.id,
      localId: data.localId.present ? data.localId.value : this.localId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      accountName: data.accountName.present
          ? data.accountName.value
          : this.accountName,
      balance: data.balance.present ? data.balance.value : this.balance,
      currency: data.currency.present ? data.currency.value : this.currency,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      isIncome: data.isIncome.present ? data.isIncome.value : this.isIncome,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      comment: data.comment.present ? data.comment.value : this.comment,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTbData(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('accountId: $accountId, ')
          ..write('accountName: $accountName, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('emoji: $emoji, ')
          ..write('isIncome: $isIncome, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('comment: $comment, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    localId,
    accountId,
    accountName,
    balance,
    currency,
    categoryId,
    categoryName,
    emoji,
    isIncome,
    amount,
    transactionDate,
    comment,
    createdAt,
    updatedAt,
    syncState,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionTbData &&
          other.id == this.id &&
          other.localId == this.localId &&
          other.accountId == this.accountId &&
          other.accountName == this.accountName &&
          other.balance == this.balance &&
          other.currency == this.currency &&
          other.categoryId == this.categoryId &&
          other.categoryName == this.categoryName &&
          other.emoji == this.emoji &&
          other.isIncome == this.isIncome &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.comment == this.comment &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncState == this.syncState);
}

class TransactionTbCompanion extends UpdateCompanion<TransactionTbData> {
  final Value<int?> id;
  final Value<int> localId;
  final Value<int> accountId;
  final Value<String> accountName;
  final Value<String> balance;
  final Value<String> currency;
  final Value<int> categoryId;
  final Value<String> categoryName;
  final Value<String> emoji;
  final Value<bool> isIncome;
  final Value<String> amount;
  final Value<String> transactionDate;
  final Value<String?> comment;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> syncState;
  const TransactionTbCompanion({
    this.id = const Value.absent(),
    this.localId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.accountName = const Value.absent(),
    this.balance = const Value.absent(),
    this.currency = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.emoji = const Value.absent(),
    this.isIncome = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.comment = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncState = const Value.absent(),
  });
  TransactionTbCompanion.insert({
    this.id = const Value.absent(),
    this.localId = const Value.absent(),
    required int accountId,
    required String accountName,
    required String balance,
    required String currency,
    required int categoryId,
    required String categoryName,
    required String emoji,
    required bool isIncome,
    required String amount,
    required String transactionDate,
    this.comment = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    required int syncState,
  }) : accountId = Value(accountId),
       accountName = Value(accountName),
       balance = Value(balance),
       currency = Value(currency),
       categoryId = Value(categoryId),
       categoryName = Value(categoryName),
       emoji = Value(emoji),
       isIncome = Value(isIncome),
       amount = Value(amount),
       transactionDate = Value(transactionDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt),
       syncState = Value(syncState);
  static Insertable<TransactionTbData> custom({
    Expression<int>? id,
    Expression<int>? localId,
    Expression<int>? accountId,
    Expression<String>? accountName,
    Expression<String>? balance,
    Expression<String>? currency,
    Expression<int>? categoryId,
    Expression<String>? categoryName,
    Expression<String>? emoji,
    Expression<bool>? isIncome,
    Expression<String>? amount,
    Expression<String>? transactionDate,
    Expression<String>? comment,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? syncState,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (localId != null) 'local_id': localId,
      if (accountId != null) 'account_id': accountId,
      if (accountName != null) 'account_name': accountName,
      if (balance != null) 'balance': balance,
      if (currency != null) 'currency': currency,
      if (categoryId != null) 'category_id': categoryId,
      if (categoryName != null) 'category_name': categoryName,
      if (emoji != null) 'emoji': emoji,
      if (isIncome != null) 'is_income': isIncome,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (comment != null) 'comment': comment,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncState != null) 'sync_state': syncState,
    });
  }

  TransactionTbCompanion copyWith({
    Value<int?>? id,
    Value<int>? localId,
    Value<int>? accountId,
    Value<String>? accountName,
    Value<String>? balance,
    Value<String>? currency,
    Value<int>? categoryId,
    Value<String>? categoryName,
    Value<String>? emoji,
    Value<bool>? isIncome,
    Value<String>? amount,
    Value<String>? transactionDate,
    Value<String?>? comment,
    Value<String>? createdAt,
    Value<String>? updatedAt,
    Value<int>? syncState,
  }) {
    return TransactionTbCompanion(
      id: id ?? this.id,
      localId: localId ?? this.localId,
      accountId: accountId ?? this.accountId,
      accountName: accountName ?? this.accountName,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      emoji: emoji ?? this.emoji,
      isIncome: isIncome ?? this.isIncome,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      comment: comment ?? this.comment,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncState: syncState ?? this.syncState,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (accountName.present) {
      map['account_name'] = Variable<String>(accountName.value);
    }
    if (balance.present) {
      map['balance'] = Variable<String>(balance.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (isIncome.present) {
      map['is_income'] = Variable<bool>(isIncome.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<String>(transactionDate.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(syncState.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTbCompanion(')
          ..write('id: $id, ')
          ..write('localId: $localId, ')
          ..write('accountId: $accountId, ')
          ..write('accountName: $accountName, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('emoji: $emoji, ')
          ..write('isIncome: $isIncome, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('comment: $comment, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }
}

class $AccountTbTable extends AccountTb
    with TableInfo<$AccountTbTable, AccountTbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountTbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<String> balance = GeneratedColumn<String>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    name,
    balance,
    currency,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_tb';
  @override
  VerificationContext validateIntegrity(
    Insertable<AccountTbData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountTbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountTbData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}balance'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AccountTbTable createAlias(String alias) {
    return $AccountTbTable(attachedDatabase, alias);
  }
}

class AccountTbData extends DataClass implements Insertable<AccountTbData> {
  final int id;
  final int userId;
  final String name;
  final String balance;
  final String currency;
  final String createdAt;
  final String updatedAt;
  const AccountTbData({
    required this.id,
    required this.userId,
    required this.name,
    required this.balance,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['name'] = Variable<String>(name);
    map['balance'] = Variable<String>(balance);
    map['currency'] = Variable<String>(currency);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  AccountTbCompanion toCompanion(bool nullToAbsent) {
    return AccountTbCompanion(
      id: Value(id),
      userId: Value(userId),
      name: Value(name),
      balance: Value(balance),
      currency: Value(currency),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AccountTbData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountTbData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      name: serializer.fromJson<String>(json['name']),
      balance: serializer.fromJson<String>(json['balance']),
      currency: serializer.fromJson<String>(json['currency']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'name': serializer.toJson<String>(name),
      'balance': serializer.toJson<String>(balance),
      'currency': serializer.toJson<String>(currency),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  AccountTbData copyWith({
    int? id,
    int? userId,
    String? name,
    String? balance,
    String? currency,
    String? createdAt,
    String? updatedAt,
  }) => AccountTbData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    name: name ?? this.name,
    balance: balance ?? this.balance,
    currency: currency ?? this.currency,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AccountTbData copyWithCompanion(AccountTbCompanion data) {
    return AccountTbData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      balance: data.balance.present ? data.balance.value : this.balance,
      currency: data.currency.present ? data.currency.value : this.currency,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountTbData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, name, balance, currency, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountTbData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.balance == this.balance &&
          other.currency == this.currency &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountTbCompanion extends UpdateCompanion<AccountTbData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> name;
  final Value<String> balance;
  final Value<String> currency;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const AccountTbCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.balance = const Value.absent(),
    this.currency = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AccountTbCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required String name,
    required String balance,
    required String currency,
    required String createdAt,
    required String updatedAt,
  }) : userId = Value(userId),
       name = Value(name),
       balance = Value(balance),
       currency = Value(currency),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<AccountTbData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? name,
    Expression<String>? balance,
    Expression<String>? currency,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (balance != null) 'balance': balance,
      if (currency != null) 'currency': currency,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AccountTbCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<String>? name,
    Value<String>? balance,
    Value<String>? currency,
    Value<String>? createdAt,
    Value<String>? updatedAt,
  }) {
    return AccountTbCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (balance.present) {
      map['balance'] = Variable<String>(balance.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountTbCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('balance: $balance, ')
          ..write('currency: $currency, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PendingTransactionTbTable extends PendingTransactionTb
    with TableInfo<$PendingTransactionTbTable, PendingTransactionTbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingTransactionTbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _accountIdMeta = const VerificationMeta(
    'accountId',
  );
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
    'account_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<String> transactionDate = GeneratedColumn<String>(
    'transaction_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _operationTypeMeta = const VerificationMeta(
    'operationType',
  );
  @override
  late final GeneratedColumn<int> operationType = GeneratedColumn<int>(
    'operation_type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    comment,
    operationType,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_transaction_tb';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingTransactionTbData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_id')) {
      context.handle(
        _accountIdMeta,
        accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta),
      );
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    if (data.containsKey('operation_type')) {
      context.handle(
        _operationTypeMeta,
        operationType.isAcceptableOrUnknown(
          data['operation_type']!,
          _operationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_operationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingTransactionTbData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingTransactionTbData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      accountId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}account_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_date'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
      operationType: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}operation_type'],
      )!,
    );
  }

  @override
  $PendingTransactionTbTable createAlias(String alias) {
    return $PendingTransactionTbTable(attachedDatabase, alias);
  }
}

class PendingTransactionTbData extends DataClass
    implements Insertable<PendingTransactionTbData> {
  final int id;
  final int accountId;
  final int categoryId;
  final String amount;
  final String transactionDate;
  final String? comment;
  final int operationType;
  const PendingTransactionTbData({
    required this.id,
    required this.accountId,
    required this.categoryId,
    required this.amount,
    required this.transactionDate,
    this.comment,
    required this.operationType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_id'] = Variable<int>(accountId);
    map['category_id'] = Variable<int>(categoryId);
    map['amount'] = Variable<String>(amount);
    map['transaction_date'] = Variable<String>(transactionDate);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['operation_type'] = Variable<int>(operationType);
    return map;
  }

  PendingTransactionTbCompanion toCompanion(bool nullToAbsent) {
    return PendingTransactionTbCompanion(
      id: Value(id),
      accountId: Value(accountId),
      categoryId: Value(categoryId),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      operationType: Value(operationType),
    );
  }

  factory PendingTransactionTbData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingTransactionTbData(
      id: serializer.fromJson<int>(json['id']),
      accountId: serializer.fromJson<int>(json['accountId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      amount: serializer.fromJson<String>(json['amount']),
      transactionDate: serializer.fromJson<String>(json['transactionDate']),
      comment: serializer.fromJson<String?>(json['comment']),
      operationType: serializer.fromJson<int>(json['operationType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountId': serializer.toJson<int>(accountId),
      'categoryId': serializer.toJson<int>(categoryId),
      'amount': serializer.toJson<String>(amount),
      'transactionDate': serializer.toJson<String>(transactionDate),
      'comment': serializer.toJson<String?>(comment),
      'operationType': serializer.toJson<int>(operationType),
    };
  }

  PendingTransactionTbData copyWith({
    int? id,
    int? accountId,
    int? categoryId,
    String? amount,
    String? transactionDate,
    Value<String?> comment = const Value.absent(),
    int? operationType,
  }) => PendingTransactionTbData(
    id: id ?? this.id,
    accountId: accountId ?? this.accountId,
    categoryId: categoryId ?? this.categoryId,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    comment: comment.present ? comment.value : this.comment,
    operationType: operationType ?? this.operationType,
  );
  PendingTransactionTbData copyWithCompanion(
    PendingTransactionTbCompanion data,
  ) {
    return PendingTransactionTbData(
      id: data.id.present ? data.id.value : this.id,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      comment: data.comment.present ? data.comment.value : this.comment,
      operationType: data.operationType.present
          ? data.operationType.value
          : this.operationType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingTransactionTbData(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('comment: $comment, ')
          ..write('operationType: $operationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    accountId,
    categoryId,
    amount,
    transactionDate,
    comment,
    operationType,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingTransactionTbData &&
          other.id == this.id &&
          other.accountId == this.accountId &&
          other.categoryId == this.categoryId &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.comment == this.comment &&
          other.operationType == this.operationType);
}

class PendingTransactionTbCompanion
    extends UpdateCompanion<PendingTransactionTbData> {
  final Value<int> id;
  final Value<int> accountId;
  final Value<int> categoryId;
  final Value<String> amount;
  final Value<String> transactionDate;
  final Value<String?> comment;
  final Value<int> operationType;
  const PendingTransactionTbCompanion({
    this.id = const Value.absent(),
    this.accountId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.comment = const Value.absent(),
    this.operationType = const Value.absent(),
  });
  PendingTransactionTbCompanion.insert({
    this.id = const Value.absent(),
    required int accountId,
    required int categoryId,
    required String amount,
    required String transactionDate,
    this.comment = const Value.absent(),
    required int operationType,
  }) : accountId = Value(accountId),
       categoryId = Value(categoryId),
       amount = Value(amount),
       transactionDate = Value(transactionDate),
       operationType = Value(operationType);
  static Insertable<PendingTransactionTbData> custom({
    Expression<int>? id,
    Expression<int>? accountId,
    Expression<int>? categoryId,
    Expression<String>? amount,
    Expression<String>? transactionDate,
    Expression<String>? comment,
    Expression<int>? operationType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountId != null) 'account_id': accountId,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (comment != null) 'comment': comment,
      if (operationType != null) 'operation_type': operationType,
    });
  }

  PendingTransactionTbCompanion copyWith({
    Value<int>? id,
    Value<int>? accountId,
    Value<int>? categoryId,
    Value<String>? amount,
    Value<String>? transactionDate,
    Value<String?>? comment,
    Value<int>? operationType,
  }) {
    return PendingTransactionTbCompanion(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      comment: comment ?? this.comment,
      operationType: operationType ?? this.operationType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<String>(transactionDate.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (operationType.present) {
      map['operation_type'] = Variable<int>(operationType.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingTransactionTbCompanion(')
          ..write('id: $id, ')
          ..write('accountId: $accountId, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('comment: $comment, ')
          ..write('operationType: $operationType')
          ..write(')'))
        .toString();
  }
}

class $CategoryTbTable extends CategoryTb
    with TableInfo<$CategoryTbTable, CategoryTbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emojiMeta = const VerificationMeta('emoji');
  @override
  late final GeneratedColumn<String> emoji = GeneratedColumn<String>(
    'emoji',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isIncomeMeta = const VerificationMeta(
    'isIncome',
  );
  @override
  late final GeneratedColumn<bool> isIncome = GeneratedColumn<bool>(
    'is_income',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_income" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, emoji, isIncome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_tb';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryTbData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('emoji')) {
      context.handle(
        _emojiMeta,
        emoji.isAcceptableOrUnknown(data['emoji']!, _emojiMeta),
      );
    } else if (isInserting) {
      context.missing(_emojiMeta);
    }
    if (data.containsKey('is_income')) {
      context.handle(
        _isIncomeMeta,
        isIncome.isAcceptableOrUnknown(data['is_income']!, _isIncomeMeta),
      );
    } else if (isInserting) {
      context.missing(_isIncomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryTbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryTbData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      emoji: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emoji'],
      )!,
      isIncome: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_income'],
      )!,
    );
  }

  @override
  $CategoryTbTable createAlias(String alias) {
    return $CategoryTbTable(attachedDatabase, alias);
  }
}

class CategoryTbData extends DataClass implements Insertable<CategoryTbData> {
  final int id;
  final String name;
  final String emoji;
  final bool isIncome;
  const CategoryTbData({
    required this.id,
    required this.name,
    required this.emoji,
    required this.isIncome,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['emoji'] = Variable<String>(emoji);
    map['is_income'] = Variable<bool>(isIncome);
    return map;
  }

  CategoryTbCompanion toCompanion(bool nullToAbsent) {
    return CategoryTbCompanion(
      id: Value(id),
      name: Value(name),
      emoji: Value(emoji),
      isIncome: Value(isIncome),
    );
  }

  factory CategoryTbData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryTbData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      emoji: serializer.fromJson<String>(json['emoji']),
      isIncome: serializer.fromJson<bool>(json['isIncome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'emoji': serializer.toJson<String>(emoji),
      'isIncome': serializer.toJson<bool>(isIncome),
    };
  }

  CategoryTbData copyWith({
    int? id,
    String? name,
    String? emoji,
    bool? isIncome,
  }) => CategoryTbData(
    id: id ?? this.id,
    name: name ?? this.name,
    emoji: emoji ?? this.emoji,
    isIncome: isIncome ?? this.isIncome,
  );
  CategoryTbData copyWithCompanion(CategoryTbCompanion data) {
    return CategoryTbData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      emoji: data.emoji.present ? data.emoji.value : this.emoji,
      isIncome: data.isIncome.present ? data.isIncome.value : this.isIncome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTbData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('isIncome: $isIncome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, emoji, isIncome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryTbData &&
          other.id == this.id &&
          other.name == this.name &&
          other.emoji == this.emoji &&
          other.isIncome == this.isIncome);
}

class CategoryTbCompanion extends UpdateCompanion<CategoryTbData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> emoji;
  final Value<bool> isIncome;
  const CategoryTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.emoji = const Value.absent(),
    this.isIncome = const Value.absent(),
  });
  CategoryTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String emoji,
    required bool isIncome,
  }) : name = Value(name),
       emoji = Value(emoji),
       isIncome = Value(isIncome);
  static Insertable<CategoryTbData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? emoji,
    Expression<bool>? isIncome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (emoji != null) 'emoji': emoji,
      if (isIncome != null) 'is_income': isIncome,
    });
  }

  CategoryTbCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? emoji,
    Value<bool>? isIncome,
  }) {
    return CategoryTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
      isIncome: isIncome ?? this.isIncome,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (emoji.present) {
      map['emoji'] = Variable<String>(emoji.value);
    }
    if (isIncome.present) {
      map['is_income'] = Variable<bool>(isIncome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryTbCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('emoji: $emoji, ')
          ..write('isIncome: $isIncome')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionTbTable transactionTb = $TransactionTbTable(this);
  late final $AccountTbTable accountTb = $AccountTbTable(this);
  late final $PendingTransactionTbTable pendingTransactionTb =
      $PendingTransactionTbTable(this);
  late final $CategoryTbTable categoryTb = $CategoryTbTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    transactionTb,
    accountTb,
    pendingTransactionTb,
    categoryTb,
  ];
}

typedef $$TransactionTbTableCreateCompanionBuilder =
    TransactionTbCompanion Function({
      Value<int?> id,
      Value<int> localId,
      required int accountId,
      required String accountName,
      required String balance,
      required String currency,
      required int categoryId,
      required String categoryName,
      required String emoji,
      required bool isIncome,
      required String amount,
      required String transactionDate,
      Value<String?> comment,
      required String createdAt,
      required String updatedAt,
      required int syncState,
    });
typedef $$TransactionTbTableUpdateCompanionBuilder =
    TransactionTbCompanion Function({
      Value<int?> id,
      Value<int> localId,
      Value<int> accountId,
      Value<String> accountName,
      Value<String> balance,
      Value<String> currency,
      Value<int> categoryId,
      Value<String> categoryName,
      Value<String> emoji,
      Value<bool> isIncome,
      Value<String> amount,
      Value<String> transactionDate,
      Value<String?> comment,
      Value<String> createdAt,
      Value<String> updatedAt,
      Value<int> syncState,
    });

class $$TransactionTbTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionTbTable> {
  $$TransactionTbTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionTbTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionTbTable> {
  $$TransactionTbTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionTbTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionTbTable> {
  $$TransactionTbTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<String> get accountName => $composableBuilder(
    column: $table.accountName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<bool> get isIncome =>
      $composableBuilder(column: $table.isIncome, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);
}

class $$TransactionTbTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionTbTable,
          TransactionTbData,
          $$TransactionTbTableFilterComposer,
          $$TransactionTbTableOrderingComposer,
          $$TransactionTbTableAnnotationComposer,
          $$TransactionTbTableCreateCompanionBuilder,
          $$TransactionTbTableUpdateCompanionBuilder,
          (
            TransactionTbData,
            BaseReferences<
              _$AppDatabase,
              $TransactionTbTable,
              TransactionTbData
            >,
          ),
          TransactionTbData,
          PrefetchHooks Function()
        > {
  $$TransactionTbTableTableManager(_$AppDatabase db, $TransactionTbTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionTbTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionTbTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionTbTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<int> localId = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<String> accountName = const Value.absent(),
                Value<String> balance = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<bool> isIncome = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<String> transactionDate = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
                Value<int> syncState = const Value.absent(),
              }) => TransactionTbCompanion(
                id: id,
                localId: localId,
                accountId: accountId,
                accountName: accountName,
                balance: balance,
                currency: currency,
                categoryId: categoryId,
                categoryName: categoryName,
                emoji: emoji,
                isIncome: isIncome,
                amount: amount,
                transactionDate: transactionDate,
                comment: comment,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncState: syncState,
              ),
          createCompanionCallback:
              ({
                Value<int?> id = const Value.absent(),
                Value<int> localId = const Value.absent(),
                required int accountId,
                required String accountName,
                required String balance,
                required String currency,
                required int categoryId,
                required String categoryName,
                required String emoji,
                required bool isIncome,
                required String amount,
                required String transactionDate,
                Value<String?> comment = const Value.absent(),
                required String createdAt,
                required String updatedAt,
                required int syncState,
              }) => TransactionTbCompanion.insert(
                id: id,
                localId: localId,
                accountId: accountId,
                accountName: accountName,
                balance: balance,
                currency: currency,
                categoryId: categoryId,
                categoryName: categoryName,
                emoji: emoji,
                isIncome: isIncome,
                amount: amount,
                transactionDate: transactionDate,
                comment: comment,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncState: syncState,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionTbTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionTbTable,
      TransactionTbData,
      $$TransactionTbTableFilterComposer,
      $$TransactionTbTableOrderingComposer,
      $$TransactionTbTableAnnotationComposer,
      $$TransactionTbTableCreateCompanionBuilder,
      $$TransactionTbTableUpdateCompanionBuilder,
      (
        TransactionTbData,
        BaseReferences<_$AppDatabase, $TransactionTbTable, TransactionTbData>,
      ),
      TransactionTbData,
      PrefetchHooks Function()
    >;
typedef $$AccountTbTableCreateCompanionBuilder =
    AccountTbCompanion Function({
      Value<int> id,
      required int userId,
      required String name,
      required String balance,
      required String currency,
      required String createdAt,
      required String updatedAt,
    });
typedef $$AccountTbTableUpdateCompanionBuilder =
    AccountTbCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<String> name,
      Value<String> balance,
      Value<String> currency,
      Value<String> createdAt,
      Value<String> updatedAt,
    });

class $$AccountTbTableFilterComposer
    extends Composer<_$AppDatabase, $AccountTbTable> {
  $$AccountTbTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AccountTbTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountTbTable> {
  $$AccountTbTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AccountTbTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountTbTable> {
  $$AccountTbTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AccountTbTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AccountTbTable,
          AccountTbData,
          $$AccountTbTableFilterComposer,
          $$AccountTbTableOrderingComposer,
          $$AccountTbTableAnnotationComposer,
          $$AccountTbTableCreateCompanionBuilder,
          $$AccountTbTableUpdateCompanionBuilder,
          (
            AccountTbData,
            BaseReferences<_$AppDatabase, $AccountTbTable, AccountTbData>,
          ),
          AccountTbData,
          PrefetchHooks Function()
        > {
  $$AccountTbTableTableManager(_$AppDatabase db, $AccountTbTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountTbTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountTbTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountTbTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> balance = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<String> updatedAt = const Value.absent(),
              }) => AccountTbCompanion(
                id: id,
                userId: userId,
                name: name,
                balance: balance,
                currency: currency,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required String name,
                required String balance,
                required String currency,
                required String createdAt,
                required String updatedAt,
              }) => AccountTbCompanion.insert(
                id: id,
                userId: userId,
                name: name,
                balance: balance,
                currency: currency,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AccountTbTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AccountTbTable,
      AccountTbData,
      $$AccountTbTableFilterComposer,
      $$AccountTbTableOrderingComposer,
      $$AccountTbTableAnnotationComposer,
      $$AccountTbTableCreateCompanionBuilder,
      $$AccountTbTableUpdateCompanionBuilder,
      (
        AccountTbData,
        BaseReferences<_$AppDatabase, $AccountTbTable, AccountTbData>,
      ),
      AccountTbData,
      PrefetchHooks Function()
    >;
typedef $$PendingTransactionTbTableCreateCompanionBuilder =
    PendingTransactionTbCompanion Function({
      Value<int> id,
      required int accountId,
      required int categoryId,
      required String amount,
      required String transactionDate,
      Value<String?> comment,
      required int operationType,
    });
typedef $$PendingTransactionTbTableUpdateCompanionBuilder =
    PendingTransactionTbCompanion Function({
      Value<int> id,
      Value<int> accountId,
      Value<int> categoryId,
      Value<String> amount,
      Value<String> transactionDate,
      Value<String?> comment,
      Value<int> operationType,
    });

class $$PendingTransactionTbTableFilterComposer
    extends Composer<_$AppDatabase, $PendingTransactionTbTable> {
  $$PendingTransactionTbTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingTransactionTbTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingTransactionTbTable> {
  $$PendingTransactionTbTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get accountId => $composableBuilder(
    column: $table.accountId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingTransactionTbTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingTransactionTbTable> {
  $$PendingTransactionTbTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<int> get operationType => $composableBuilder(
    column: $table.operationType,
    builder: (column) => column,
  );
}

class $$PendingTransactionTbTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingTransactionTbTable,
          PendingTransactionTbData,
          $$PendingTransactionTbTableFilterComposer,
          $$PendingTransactionTbTableOrderingComposer,
          $$PendingTransactionTbTableAnnotationComposer,
          $$PendingTransactionTbTableCreateCompanionBuilder,
          $$PendingTransactionTbTableUpdateCompanionBuilder,
          (
            PendingTransactionTbData,
            BaseReferences<
              _$AppDatabase,
              $PendingTransactionTbTable,
              PendingTransactionTbData
            >,
          ),
          PendingTransactionTbData,
          PrefetchHooks Function()
        > {
  $$PendingTransactionTbTableTableManager(
    _$AppDatabase db,
    $PendingTransactionTbTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingTransactionTbTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingTransactionTbTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingTransactionTbTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> accountId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> amount = const Value.absent(),
                Value<String> transactionDate = const Value.absent(),
                Value<String?> comment = const Value.absent(),
                Value<int> operationType = const Value.absent(),
              }) => PendingTransactionTbCompanion(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                comment: comment,
                operationType: operationType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int accountId,
                required int categoryId,
                required String amount,
                required String transactionDate,
                Value<String?> comment = const Value.absent(),
                required int operationType,
              }) => PendingTransactionTbCompanion.insert(
                id: id,
                accountId: accountId,
                categoryId: categoryId,
                amount: amount,
                transactionDate: transactionDate,
                comment: comment,
                operationType: operationType,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingTransactionTbTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingTransactionTbTable,
      PendingTransactionTbData,
      $$PendingTransactionTbTableFilterComposer,
      $$PendingTransactionTbTableOrderingComposer,
      $$PendingTransactionTbTableAnnotationComposer,
      $$PendingTransactionTbTableCreateCompanionBuilder,
      $$PendingTransactionTbTableUpdateCompanionBuilder,
      (
        PendingTransactionTbData,
        BaseReferences<
          _$AppDatabase,
          $PendingTransactionTbTable,
          PendingTransactionTbData
        >,
      ),
      PendingTransactionTbData,
      PrefetchHooks Function()
    >;
typedef $$CategoryTbTableCreateCompanionBuilder =
    CategoryTbCompanion Function({
      Value<int> id,
      required String name,
      required String emoji,
      required bool isIncome,
    });
typedef $$CategoryTbTableUpdateCompanionBuilder =
    CategoryTbCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> emoji,
      Value<bool> isIncome,
    });

class $$CategoryTbTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryTbTable> {
  $$CategoryTbTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryTbTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryTbTable> {
  $$CategoryTbTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emoji => $composableBuilder(
    column: $table.emoji,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isIncome => $composableBuilder(
    column: $table.isIncome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryTbTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryTbTable> {
  $$CategoryTbTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get emoji =>
      $composableBuilder(column: $table.emoji, builder: (column) => column);

  GeneratedColumn<bool> get isIncome =>
      $composableBuilder(column: $table.isIncome, builder: (column) => column);
}

class $$CategoryTbTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryTbTable,
          CategoryTbData,
          $$CategoryTbTableFilterComposer,
          $$CategoryTbTableOrderingComposer,
          $$CategoryTbTableAnnotationComposer,
          $$CategoryTbTableCreateCompanionBuilder,
          $$CategoryTbTableUpdateCompanionBuilder,
          (
            CategoryTbData,
            BaseReferences<_$AppDatabase, $CategoryTbTable, CategoryTbData>,
          ),
          CategoryTbData,
          PrefetchHooks Function()
        > {
  $$CategoryTbTableTableManager(_$AppDatabase db, $CategoryTbTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryTbTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryTbTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryTbTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> emoji = const Value.absent(),
                Value<bool> isIncome = const Value.absent(),
              }) => CategoryTbCompanion(
                id: id,
                name: name,
                emoji: emoji,
                isIncome: isIncome,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String emoji,
                required bool isIncome,
              }) => CategoryTbCompanion.insert(
                id: id,
                name: name,
                emoji: emoji,
                isIncome: isIncome,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryTbTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryTbTable,
      CategoryTbData,
      $$CategoryTbTableFilterComposer,
      $$CategoryTbTableOrderingComposer,
      $$CategoryTbTableAnnotationComposer,
      $$CategoryTbTableCreateCompanionBuilder,
      $$CategoryTbTableUpdateCompanionBuilder,
      (
        CategoryTbData,
        BaseReferences<_$AppDatabase, $CategoryTbTable, CategoryTbData>,
      ),
      CategoryTbData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionTbTableTableManager get transactionTb =>
      $$TransactionTbTableTableManager(_db, _db.transactionTb);
  $$AccountTbTableTableManager get accountTb =>
      $$AccountTbTableTableManager(_db, _db.accountTb);
  $$PendingTransactionTbTableTableManager get pendingTransactionTb =>
      $$PendingTransactionTbTableTableManager(_db, _db.pendingTransactionTb);
  $$CategoryTbTableTableManager get categoryTb =>
      $$CategoryTbTableTableManager(_db, _db.categoryTb);
}
