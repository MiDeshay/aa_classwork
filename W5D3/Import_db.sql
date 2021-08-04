PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL

);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL, 

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL, 
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    parent_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    question_like BOOLEAN,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)

);

INSERT INTO 
    users(id, fname, lname)
VALUES
    (0, 'Michael', 'Deshay'),
    (1, 'Andrew', 'Roellig');


INSERT INTO
    questions(id, title, body, user_id)
VALUES
    (0, 'just wondering', 'what color is the sky?', 1);


INSERT INTO
    question_follows(user_id, question_id)
VALUES
    (1, 0);

INSERT INTO
    replies(id, body, user_id, question_id, parent_id)
VALUES
    (0, 'the sky is blue', 0, 0, null),
    (1, 'thanks', 1, 0, 0);

INSERT INTO
    question_likes(user_id, question_id, question_like)
VALUES
    (0, 0, TRUE);



