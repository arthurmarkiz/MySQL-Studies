DROP DATABASE ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

-- ===================================
-- USERS
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

-- ===================================
-- PHOTOS
CREATE TABLE photos (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- ===================================
-- COMMENTS
CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

-- ===================================
-- LIKES
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

-- ===================================
-- FOLLOWS
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

-- ===================================
-- TAGS
CREATE TABLE tags (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- ===================================
-- PHOTO TAGS
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

-- ===================================
-- ### DATA ###

INSERT INTO users (username) VALUES
('ArthurMarkiz'),
('CharlieBrown'),
('YuriPereira');

INSERT INTO photos (image_url, user_id) VALUES
('/afi23uha5sfuiw', 1),
('/a1wiuhg3ifa', 2),
('/aww8ry98qasd', 3);

INSERT INTO comments (comment_text, user_id, photo_id) VALUES
('Woow awesome!!!', 1, 3),
('Amazing shot :D', 3, 1),
('You have a good eye for that lol', 2, 1);

INSERT INTO likes (user_id, photo_id) VALUES
(1,1), (3,1), (2,1), (1,2), (1,3);

INSERT INTO follows (follower_id, followee_id) VALUES
(1, 2), (3, 1), (2, 1), (1, 3);

INSERT INTO tags (tag_name) VALUES
('cats'), ('cute'), ('funny');

INSERT INTO photo_tags (photo_id, tag_id) VALUES
(1, 1), (1, 2), (3, 3);