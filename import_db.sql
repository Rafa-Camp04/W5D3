PRAGMA foreign_keys = ON;

DROP TABLE if exists question_likes;
DROP TABLE if exists replies;
DROP TABLE if exists question_follows;
DROP TABLE if exists questions;
DROP TABLE if exists users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    follower_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    question_id INTEGER,
    parent_id INTEGER,
    author_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    likes_id INTEGER,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (likes_id) REFERENCES users(id)
);

INSERT INTO users (first_name, last_name) VALUES
    ('Rafael', 'Campos'),
    ('Cristiano', 'Ronaldo'),
    ('Lionel', 'Messi');

INSERT INTO questions (title, body, author_id) VALUES
    ('Q1 Title', 'Q1 Body', 1),
    ('Q2 Title', 'Q2 Body', 2),
    ('Q3 Title', 'Q3 Body', 3);

INSERT INTO question_follows (question_id, follower_id) VALUES
    (1, 2),
    (2, 3),
    (3, 1);

INSERT INTO replies (body, question_id, parent_id, author_id) VALUES
    ('Body 1', 1, NULL, 1),
    ('Body 2', 2, 1, 2),
    ('Body 3', 3, 2, 3);

INSERT INTO question_likes (question_id, likes_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3);