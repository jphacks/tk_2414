import 'package:drift/drift.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Lectures,
    Structures,
    Segments,
    Courses,
    Tests,
    Questions,
    Choices,
    Grades,
    Users,
    UserSubjects,
    UserClasses,
    Subjects,
    Classes,
    UserProgresses,
    SegmentsLocal,
    Chats,
    Messages,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll(); // 全てのテーブルを作成
        },
      );
}

///================================================================================================
///
/// Tables
///
///================================================================================================
class Lectures extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get courseId => text().references(Courses, #id)();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get prev => text().nullable()();
  TextColumn get next => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Structures extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get lectureId => text().references(Lectures, #id)();
  TextColumn get name => text()();
  TextColumn get type => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Segments extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get lectureId => text().references(Lectures, #id)();
  TextColumn get prev => text().nullable()();
  TextColumn get next => text().nullable()();
  TextColumn get content => text()();
  BlobColumn get voice => blob()();
  TextColumn get structureId => text().references(Structures, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Courses extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get gradeId => text().references(Grades, #id)();
  TextColumn get subject => text().references(Subjects, #id)();
  TextColumn get classId => text().references(Classes, #id)();
  TextColumn get level => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Tests extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get lectureId => text().references(Lectures, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Questions extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get testId => text().references(Tests, #id)();
  TextColumn get questionText => text()(); // 正しくはこの形です
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Choices extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get questionId => text().references(Questions, #id)();
  TextColumn get choiceText => text()(); // 正しくはこの形です
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Grades extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Users extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get name => text()();
  TextColumn get gradeId => text().references(Grades, #id)();
  DateTimeColumn get birthday => dateTime()();
  TextColumn get gender => text()();
  TextColumn get address => text()();
  TextColumn get email => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class UserSubjects extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get subjectId => text().references(Subjects, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class UserClasses extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get classId => text().references(Classes, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Subjects extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Classes extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get name => text()();
  TextColumn get subjectId => text().references(Subjects, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class UserProgresses extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get lectureId => text().references(Lectures, #id)();
  TextColumn get userId => text().references(Users, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class SegmentsLocal extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get lectureId => text().references(Lectures, #id)();
  TextColumn get prev => text().nullable()();
  TextColumn get next => text().nullable()();
  TextColumn get content => text()();
  IntColumn get page => integer()();
  BlobColumn get voice => blob()();
  TextColumn get structureId => text().references(Structures, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Chats extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  TextColumn get userId => text().references(Users, #id)();
  TextColumn get segmentId => text().references(Segments, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

class Messages extends Table {
  TextColumn get id => text().customConstraint('PRIMARY KEY')();
  BoolColumn get isUser => boolean()();
  TextColumn get chatId => text().references(Chats, #id)();
  TextColumn get prev => text().nullable()();
  TextColumn get next => text().nullable()();
  TextColumn get message => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get deletedAt => dateTime().nullable()();
}
