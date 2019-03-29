-- write a SQL query that returns a list of users along with their friends' names.

SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name
FROM users
JOIN friendships
ON users.id = friendships.user_id
-- ON users.id = friendships.friend_id
JOIN users AS user2
ON user2.id = friendships.friend_id;
-- ON users.id = friendships.friend_id;

-- Return all users who are friends with Kermit, make sure their names are displayed in results.

SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name
FROM users
JOIN friendships
ON users.id = friendships.user_id
JOIN users AS user2
ON user2.id = friendships.friend_id
WHERE user2.first_name = "Kermit";

--  Return the count of all friendships

SELECT COUNT(friendships.id) AS number_of_friendships
FROM users
JOIN friendships
ON users.id = friendships.user_id
JOIN users AS user2
ON user2.id = friendships.friend_id;

-- Find out who has the most friends and return the count of their friends.

SELECT users.id, users.first_name, COUNT(user2.first_name) AS number_of_friendships
FROM users
JOIN friendships
ON users.id = friendships.user_id
JOIN users AS user2
ON user2.id = friendships.friend_id
GROUP BY first_name;

-- Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark

INSERT INTO `sys`.`users` (`id`, `first_name`, `last_name`, `created_at`) VALUES ('6', 'Dan', 'Pan', '2019-02-08 11:12:11');
INSERT INTO `sys`.`friendships` (`id`, `user_id`, `friend_id`, `created_at`) VALUES ('7', '6', '2', '2019-02-08 11:16:02');
INSERT INTO `sys`.`friendships` (`id`, `user_id`, `friend_id`, `created_at`) VALUES ('8', '6', '4', '2019-02-08 11:16:02');
INSERT INTO `sys`.`friendships` (`id`, `user_id`, `friend_id`, `created_at`) VALUES ('9', '6', '5', '2019-02-08 11:16:02');

-- Return the friends of Eli in alphabetical order

SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name
FROM users
JOIN friendships
ON users.id = friendships.user_id
JOIN users AS user2
ON user2.id = friendships.friend_id
WHERE users.first_name = "Eli"
ORDER BY friend_first_name ASC;

-- Remove Marky Mark from Eli’s friends.

DELETE FROM `sys`.`friendships` WHERE (`id` = '5');



