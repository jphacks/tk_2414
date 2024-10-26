-- データベースの作成
CREATE DATABASE fairedu;

-- データベースの使用
\c fairedu;

-- テーブル削除と作成: lectures
DROP TABLE IF EXISTS lectures CASCADE;
CREATE TABLE lectures (
    id TEXT PRIMARY KEY,
    course_id TEXT,
    name TEXT,
    description TEXT,
    prev TEXT,
    next TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: structures
DROP TABLE IF EXISTS structures CASCADE;
CREATE TABLE structures (
    id TEXT PRIMARY KEY,
    lecture_id TEXT,
    name TEXT,
    type TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: segments
DROP TABLE IF EXISTS segments CASCADE;
CREATE TABLE segments (
    id TEXT PRIMARY KEY,
    lecture_id TEXT,
    prev TEXT,
    next TEXT,
    content TEXT,
    voice BYTEA,
    structure_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: courses
DROP TABLE IF EXISTS courses CASCADE;
CREATE TABLE courses (
    id TEXT PRIMARY KEY,
    name TEXT,
    description TEXT,
    grade_id TEXT,
    subject TEXT,
    class TEXT,
    level TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: tests
DROP TABLE IF EXISTS tests CASCADE;
CREATE TABLE tests (
    id TEXT PRIMARY KEY,
    lecture_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: questions
DROP TABLE IF EXISTS questions CASCADE;
CREATE TABLE questions (
    id TEXT PRIMARY KEY,
    test_id TEXT,
    text TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: choices
DROP TABLE IF EXISTS choices CASCADE;
CREATE TABLE choices (
    id TEXT PRIMARY KEY,
    question_id TEXT,
    text TEXT,
    is_correct BOOLEAN,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: grades
DROP TABLE IF EXISTS grades CASCADE;
CREATE TABLE grades (
    id TEXT PRIMARY KEY,
    name TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: users
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    id TEXT PRIMARY KEY,
    name TEXT,
    grade_id TEXT,
    birthday TIMESTAMP WITH TIME ZONE,
    gender TEXT,
    address TEXT,
    email TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: user_subjects
DROP TABLE IF EXISTS user_subjects CASCADE;
CREATE TABLE user_subjects (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    subject_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: user_classes
DROP TABLE IF EXISTS user_classes CASCADE;
CREATE TABLE user_classes (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    class_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: subjects
DROP TABLE IF EXISTS subjects CASCADE;
CREATE TABLE subjects (
    id TEXT PRIMARY KEY,
    name TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: classes
DROP TABLE IF EXISTS classes CASCADE;
CREATE TABLE classes (
    id TEXT PRIMARY KEY,
    name TEXT,
    subject_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: user_progresses
DROP TABLE IF EXISTS user_progresses CASCADE;
CREATE TABLE user_progresses (
    id TEXT PRIMARY KEY,
    lecture_id TEXT,
    user_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: segments_local
DROP TABLE IF EXISTS segments_local CASCADE;
CREATE TABLE segments_local (
    id TEXT PRIMARY KEY,
    lecture_id TEXT,
    user_id TEXT,
    prev TEXT,
    next TEXT,
    content TEXT,
    page INT,
    voice BYTEA,
    structure_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: chats
DROP TABLE IF EXISTS chats CASCADE;
CREATE TABLE chats (
    id TEXT PRIMARY KEY,
    user_id TEXT,
    segment_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: messages
DROP TABLE IF EXISTS messages CASCADE;
CREATE TABLE messages (
    id TEXT PRIMARY KEY,
    is_user BOOLEAN,
    chat_id TEXT,
    prev TEXT,
    next TEXT,
    message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- テーブル削除と作成: quiz_results
DROP TABLE IF EXISTS quiz_results CASCADE;
CREATE TABLE quiz_results (
    id TEXT PRIMARY KEY,
    test_id TEXT NOT NULL,
    question_id TEXT NOT NULL,
    choice_id TEXT NOT NULL,
    user_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

-- サンプルデータの挿入: grades
INSERT INTO grades (id, name) VALUES
('g1', 'Grade 1'),
('g2', 'Grade 2'),
('g3', 'Grade 3'),
('g4', 'Grade 4');

-- サンプルデータの挿入: subjects
INSERT INTO subjects (id, name) VALUES
('sub1', 'Mathematics'),
('sub2', 'Science'),
('sub3', 'History'),
('sub4', 'English');

-- サンプルデータの挿入: classes
INSERT INTO classes (id, name, subject_id) VALUES
('class1', 'Class A', 'sub1'),
('class2', 'Class B', 'sub2'),
('class3', 'Class C', 'sub3'),
('class4', 'Class D', 'sub4');

-- サンプルデータの挿入: users
INSERT INTO users (id, name, grade_id, birthday, gender, address, email) VALUES
('user1', 'John Doe', 'g1', '2010-01-01', 'Male', '123 Main St', 'john@example.com'),
('user2', 'Jane Smith', 'g2', '2011-02-02', 'Female', '456 Oak St', 'jane@example.com'),
('user3', 'Alice Johnson', 'g3', '2009-03-03', 'Female', '789 Pine St', 'alice@example.com'),
('user4', 'Bob Brown', 'g4', '2008-04-04', 'Male', '101 Maple St', 'bob@example.com');

-- サンプルデータの挿入: courses
INSERT INTO courses (id, name, description, grade_id, subject, class, level) VALUES
('course1', 'Math Basics', 'Basic Math Course', 'g1', 'sub1', 'class1', 'Beginner'),
('course2', 'Science Advanced', 'Advanced Science Course', 'g2', 'sub2', 'class2', 'Advanced'),
('course3', 'History of Ancient Civilizations', 'Intro to Ancient History', 'g3', 'sub3', 'class3', 'Intermediate'),
('course4', 'English Literature', 'Exploration of classic English literature', 'g4', 'sub4', 'class4', 'Advanced');

-- サンプルデータの挿入: lectures
INSERT INTO lectures (id, course_id, name, description, prev, next) VALUES
('lec1', 'course1', 'Introduction to Math', 'This is the first math lecture.', NULL, 'lec2'),
('lec2', 'course1', 'Basic Addition', 'This lecture covers basic addition.', 'lec1', 'lec3'),
('lec3', 'course1', 'Basic Subtraction', 'This lecture covers basic subtraction.', 'lec2', NULL),
('lec4', 'course2', 'Introduction to Science', 'This is the first science lecture.', NULL, 'lec5'),
('lec5', 'course2', 'Physics Basics', 'This lecture covers basic physics.', 'lec4', NULL),
('lec6', 'course3', 'Ancient Egypt', 'This lecture explores Ancient Egypt.', NULL, 'lec7'),
('lec7', 'course3', 'Ancient Greece', 'This lecture explores Ancient Greece.', 'lec6', NULL),
('lec8', 'course4', 'Shakespeare', 'This lecture discusses the works of Shakespeare.', NULL, 'lec9'),
('lec9', 'course4', 'Modern Literature', 'This lecture covers modern literature.', 'lec8', NULL);

-- サンプルデータの挿入: structures
INSERT INTO structures (id, lecture_id, name, type) VALUES
('str1', 'lec1', 'Lecture Overview', 'Text'),
('str2', 'lec2', 'Addition Examples', 'Exercise'),
('str3', 'lec3', 'Subtraction Exercises', 'Exercise'),
('str4', 'lec4', 'Science Overview', 'Text'),
('str5', 'lec5', 'Physics Problems', 'Exercise'),
('str6', 'lec6', 'Ancient Egypt Overview', 'Text'),
('str7', 'lec7', 'Ancient Greece Overview', 'Text'),
('str8', 'lec8', 'Shakespeare Overview', 'Text'),
('str9', 'lec9', 'Modern Literature Overview', 'Text');

-- サンプルデータの挿入: segments
INSERT INTO segments (id, lecture_id, prev, next, content, voice, structure_id) VALUES
('seg1', 'lec1', NULL, 'seg2', 'Welcome to the math course!', NULL, 'str1'),
('seg2', 'lec1', 'seg1', NULL, 'Basic math introduction.', NULL, 'str1'),
('seg3', 'lec4', NULL, 'seg4', 'Welcome to the science course!', NULL, 'str4'),
('seg4', 'lec4', 'seg3', NULL, 'Basic science introduction.', NULL, 'str4'),
('seg5', 'lec6', NULL, 'seg6', 'Welcome to Ancient Egypt lecture.', NULL, 'str6'),
('seg6', 'lec6', 'seg5', NULL, 'Egyptian civilization overview.', NULL, 'str6');

-- サンプルデータの挿入: segments
INSERT INTO segments_local (id, lecture_id, prev, next, content, voice, structure_id) VALUES
('seg1', 'lec1', NULL, 'seg2', 'Welcome to the math course!', NULL, 'str1'),
('seg2', 'lec1', 'seg1', NULL, 'Basic math introduction.', NULL, 'str1'),
('seg3', 'lec4', NULL, 'seg4', 'Welcome to the science course!', NULL, 'str4'),
('seg4', 'lec4', 'seg3', NULL, 'Basic science introduction.', NULL, 'str4'),
('seg5', 'lec6', NULL, 'seg6', 'Welcome to Ancient Egypt lecture.', NULL, 'str6'),
('seg6', 'lec6', 'seg5', NULL, 'Egyptian civilization overview.', NULL, 'str6');

-- サンプルデータの挿入: tests
INSERT INTO tests (id, lecture_id) VALUES
('test1', 'lec2'),
('test2', 'lec5'),
('test3', 'lec7'),
('test4', 'lec9');

-- サンプルデータの挿入: questions
INSERT INTO questions (id, test_id, text) VALUES
('q1', 'test1', 'What is 2 + 2?'),
('q2', 'test1', 'What is 5 - 3?'),
('q3', 'test2', 'What is Newton’s First Law?'),
('q4', 'test3', 'Who was the first pharaoh of Egypt?'),
('q5', 'test4', 'What is Shakespeare’s most famous play?');

-- サンプルデータの挿入: choices
INSERT INTO choices (id, question_id, text, is_correct) VALUES
('choice1', 'q1', '4', TRUE),
('choice2', 'q1', '5', FALSE),
('choice3', 'q2', '2', TRUE),
('choice4', 'q2', '3', FALSE),
('choice5', 'q3', 'An object in motion stays in motion.', TRUE),
('choice6', 'q3', 'Energy cannot be created or destroyed.', FALSE),
('choice7', 'q4', 'Narmer', TRUE),
('choice8', 'q4', 'Tutankhamun', FALSE),
('choice9', 'q5', 'Hamlet', TRUE),
('choice10', 'q5', 'Macbeth', FALSE);

-- サンプルデータの挿入: user_progresses
INSERT INTO user_progresses (id, lecture_id, user_id) VALUES
('progress1', 'lec1', 'user1'),
('progress2', 'lec4', 'user2'),
('progress3', 'lec6', 'user3'),
('progress4', 'lec8', 'user4');

-- サンプルデータの挿入: chats
INSERT INTO chats (id, user_id, segment_id) VALUES
('chat1', 'user1', 'seg1'),
('chat2', 'user2', 'seg3'),
('chat3', 'user3', 'seg5');

-- サンプルデータの挿入: messages
INSERT INTO messages (id, is_user, chat_id, prev, next, message) VALUES
('msg1', TRUE, 'chat1', NULL, 'msg2', 'What is 2+2?'),
('msg2', FALSE, 'chat1', 'msg1', NULL, 'It is 4.'),
('msg3', TRUE, 'chat2', NULL, 'msg4', 'What is Newton’s first law?'),
('msg4', FALSE, 'chat2', 'msg3', NULL, 'An object in motion stays in motion.'),
('msg5', TRUE, 'chat3', NULL, NULL, 'Who was the first pharaoh of Egypt?');