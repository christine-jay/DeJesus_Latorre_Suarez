-- User Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255),
    Email VARCHAR(255),
    Height FLOAT,
    TargetWeight FLOAT
);

-- WeightEntry Table
CREATE TABLE WeightEntry (
    EntryID INT PRIMARY KEY,
    UserID INT,
    Date DATE,
    Weight FLOAT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Exercise Table
CREATE TABLE Exercise (
    ExerciseID INT PRIMARY KEY,
    Name VARCHAR(255),
    CaloriesBurnedPerMinute FLOAT
);

-- ExerciseLog Table
CREATE TABLE ExerciseLog (
    LogID INT PRIMARY KEY,
    UserID INT,
    ExerciseID INT,
    Date DATE,
    Duration INT,
    CaloriesBurned FLOAT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

-- Meal Table
CREATE TABLE Meal (
    MealID INT PRIMARY KEY,
    Name VARCHAR(255),
    CaloriesPerServing FLOAT
);

-- FoodEntry Table
CREATE TABLE FoodEntry (
    EntryID INT PRIMARY KEY,
    UserID INT,
    MealID INT,
    Date DATE,
    ServingSize FLOAT,
    CaloriesConsumed FLOAT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MealID) REFERENCES Meal(MealID)
);

-- UserFavoriteExercise Table (Many-to-Many)
CREATE TABLE UserFavoriteExercise (
    UserID INT,
    ExerciseID INT,
    PRIMARY KEY (UserID, ExerciseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

-- UserFavoriteMeal Table (Many-to-Many)
CREATE TABLE UserFavoriteMeal (
    UserID INT,
    MealID INT,
    PRIMARY KEY (UserID, MealID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (MealID) REFERENCES Meal(MealID)
);


-- User Table
INSERT INTO User (UserID, Username, Password, Email, Height, TargetWeight)
VALUES
(1, 'user1', 'password1', 'user1@email.com', 170, 150),
(2, 'user2', 'password2', 'user2@email.com', 160, 140),
(3, 'user3', 'password3', 'user3@email.com', 180, 160),
(4, 'user4', 'password4', 'user4@email.com', 175, 155),
(5, 'user5', 'password5', 'user5@email.com', 165, 145),
(6, 'user6', 'password6', 'user6@email.com', 185, 170),
(7, 'user7', 'password7', 'user7@email.com', 155, 140),
(8, 'user8', 'password8', 'user8@email.com', 170, 155),
(9, 'user9', 'password9', 'user9@email.com', 160, 145),
(10, 'user10', 'password10', 'user10@email.com', 175, 160);

-- WeightEntry Table
INSERT INTO WeightEntry (EntryID, UserID, Date, Weight)
VALUES
(1, 1, '2023-01-01', 160),
(2, 1, '2023-02-01', 158),
(3, 2, '2023-01-01', 140),
(4, 2, '2023-02-01', 138),
(5, 3, '2023-01-01', 160),
(6, 3, '2023-02-01', 158),
(7, 4, '2023-01-01', 155),
(8, 4, '2023-02-01', 153),
(9, 5, '2023-01-01', 145),
(10, 5, '2023-02-01', 143);

-- Exercise Table
INSERT INTO Exercise (ExerciseID, Name, CaloriesBurnedPerMinute)
VALUES
(1, 'Running', 10),
(2, 'Cycling', 8),
(3, 'Swimming', 12),
(4, 'Weightlifting', 5),
(5, 'Yoga', 3),
(6, 'Jump Rope', 15),
(7, 'Hiking', 7),
(8, 'Dancing', 6),
(9, 'Elliptical', 9),
(10, 'Rowing', 11);

-- ExerciseLog Table
INSERT INTO ExerciseLog (LogID, UserID, ExerciseID, Date, Duration, CaloriesBurned)
VALUES
(1, 1, 1, '2023-01-02', 30, 300),
(2, 1, 2, '2023-01-03', 45, 360),
(3, 2, 3, '2023-01-02', 60, 720),
(4, 2, 4, '2023-01-03', 40, 200),
(5, 3, 5, '2023-01-02', 20, 60),
(6, 3, 6, '2023-01-03', 15, 225),
(7, 4, 7, '2023-01-02', 50, 350),
(8, 4, 8, '2023-01-03', 30, 180),
(9, 5, 9, '2023-01-02', 35, 315),
(10, 5, 10, '2023-01-03', 25, 275);

-- Meal Table
INSERT INTO Meal (MealID, Name, CaloriesPerServing)
VALUES
(1, 'Chicken Salad', 350),
(2, 'Vegetable Stir-Fry', 300),
(3, 'Grilled Salmon', 400),
(4, 'Quinoa Bowl', 320),
(5, 'Oatmeal', 200),
(6, 'Greek Yogurt Parfait', 250),
(7, 'Turkey Sandwich', 450),
(8, 'Veggie Wrap', 350),
(9, 'Fruit Salad', 150),
(10, 'Smoothie', 200);

-- FoodEntry Table
INSERT INTO FoodEntry (EntryID, UserID, MealID, Date, ServingSize, CaloriesConsumed)
VALUES
(1, 1, 1, '2023-01-02', 1, 350),
(2, 1, 2, '2023-01-03', 1.5, 450),
(3, 2, 3, '2023-01-02', 1, 400),
(4, 2, 4, '2023-01-03', 1, 320),
(5, 3, 5, '2023-01-02', 0.75, 150),
(6, 3, 6, '2023-01-03', 1, 250),
(7, 4, 7, '2023-01-02', 1, 450),
(8, 4, 8, '2023-01-03', 1, 350),
(9, 5, 9, '2023-01-02', 1.5, 225),
(10, 5, 10, '2023-01-03', 1, 200);

-- UserFavoriteExercise Table (Many-to-Many)
INSERT INTO UserFavoriteExercise (UserID, ExerciseID)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 6),
(4, 7),
(5, 10),
(6, 4),
(7, 5),
(8, 8),
(9, 9);

-- UserFavoriteMeal Table (Many-to-Many)
INSERT INTO UserFavoriteMeal (UserID, MealID)
VALUES
(1, 1),
(1, 3),
(2, 2),
(3, 6),
(4, 7),
(5, 10),
(6, 4),
(7, 5),
(8, 8),
(9, 9);

--QUERIES-- 

-- 4X INSERT QUERIES-- 

--INSERT/LOG EXERCISE FOR THE DAY-- 
INSERT INTO ExerciseLog (LogID, UserID, ExerciseID, Date, Duration, CaloriesBurned)
VALUES
(11, 1, 1, '2023-01-04', 45, 450);

--INSERT/LOG MEAL FOR THE DAY-- 
INSERT INTO FoodEntry (EntryID, UserID, MealID, Date, ServingSize, CaloriesConsumed)
VALUES
(11, 1, 3, '2023-01-04', 1, 400);

--INSERT NEW EXERCISE IN THE EXERCISE TABLE--
INSERT INTO Exercise (ExerciseID, Name, CaloriesBurnedPerMinute)
VALUES
(11, 'Crunches', 9);

--INSERT NEW MEAL IN THE MEAL TABLE-- 
INSERT INTO Meal (MealID, Name, CaloriesPerServing)
VALUES
(11, 'Tuna Sandwhich', 250); 

--2X UPDATE QUERIES-- 

--UPDATE THE TARGET WEIGHT OF USER1--
UPDATE Users
SET TargetWeight = 160
WHERE UserID = 1;

--UPDATE THE USERNAME OF USER2-- 
UPDATE Users
SET Username = 'NewUsername'
WHERE UserID = 2;

--2X DELETE QUERIES-- 

--DELETE SPECIFIC WEIGHT ENTRY-- 
DELETE FROM WeightEntry
WHERE EntryID = 5;

--DELETE MEAL IN THE MEAL TABLE-- 
DELETE FROM Meal
WHERE MealID = 11;

--8X SELECT QUERIES-- 

--SELECT MEALS ORDER BY (LOW CALORIES)-- 
SELECT * FROM Meal
ORDER BY CaloriesPerServing ASC;

--SELECT EXERCISE ORDER BY (HIGH INTENSITY)--
SELECT * FROM Exercise
ORDER BY CaloriesBurnedPerMinute DESC;

--SELECT USERS WITH TARGET WEIGHT = 160--
SELECT Username, TargetWeight
FROM Users
WHERE TargetWeight = 160;

--SELECT MEALS WHICH CALORIES IS < 400-- 
SELECT Name
FROM Meal
WHERE CaloriesPerServing < 400;

--SELECT EXERCISE WHICH CALORIES BURNED IS > 8--
SELECT Name
FROM Exercise
WHERE CaloriesBurnedPerMinute > 8;

--SELECT USER1 FAVORITE MEALS-- 
SELECT Users.Username, Meal.Name AS FavoriteMeal
FROM Users
JOIN UserFavoriteMeal ON Users.UserID = UserFavoriteMeal.UserID
JOIN Meal ON UserFavoriteMeal.MealID = Meal.MealID
WHERE Users.UserID = 1;

--SELECT USER1 FAVORITE EXERCISE--
SELECT Users.Username, Exercise.Name AS FavoriteExercise
FROM Users
JOIN UserFavoriteExercise ON Users.UserID = UserFavoriteExercise.UserID
JOIN Exercise ON UserFavoriteExercise.ExerciseID = Exercise.ExerciseID
WHERE Users.UserID = 1;

--4X JOIN QUERIES-- 

--SELECT THE MOST FAVORITE MEAL-- 
SELECT
    Meal.MealID,
    Meal.Name,
    COUNT(UserFavoriteMeal.MealID) AS FavoriteCount
FROM
    Meal
JOIN
    UserFavoriteMeal ON Meal.MealID = UserFavoriteMeal.MealID
GROUP BY
    Meal.MealID, Meal.Name
ORDER BY
    FavoriteCount DESC
LIMIT 1;

--SELECT THE MOST FAVORITE EXERCISE-- 
SELECT
    Exercise.ExerciseID,
    Exercise.Name,
    COUNT(UserFavoriteExercise.ExerciseID) AS FavoriteCount
FROM
    Exercise
JOIN
    UserFavoriteExercise ON Exercise.ExerciseID = UserFavoriteExercise.ExerciseID
GROUP BY
    Exercise.ExerciseID, Exercise.Name
ORDER BY
    FavoriteCount DESC
LIMIT 1;

--SELECT USERS WITH MOST WEIGHT ENTRIES-- 
SELECT
    Users.UserID,
    Users.Username,
    COUNT(WeightEntry.EntryID) AS WeightEntryCount
FROM
    Users
JOIN
    WeightEntry ON Users.UserID = WeightEntry.UserID
GROUP BY
    Users.UserID, Users.Username
ORDER BY
    WeightEntryCount DESC
LIMIT 1;

--RETRIEVE USERS AND THEIR LATEST WEIGHT ENTRY-- 
SELECT
    Users.Username,
    WeightEntry.Date,
    WeightEntry.Weight
FROM
    Users
LEFT JOIN
    WeightEntry ON Users.UserID = WeightEntry.UserID
WHERE
    WeightEntry.EntryID = (
        SELECT MAX(EntryID) FROM WeightEntry WHERE UserID = Users.UserID
    );




