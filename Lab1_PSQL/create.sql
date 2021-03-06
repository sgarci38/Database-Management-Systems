-- Create Tables
CREATE TABLE Keepers (
keeperID INT,
name VARCHAR(30),
hireDate DATE,
keeperLevel CHAR (1),
keeperSalary NUMERIC (7,2),
PRIMARY KEY (KeeperID)
);

CREATE TABLE Cages (
cageID INT,
cageSector CHAR(1),
keeperID INT,
PRIMARY KEY (cageID),
FOREIGN KEY (keeperID) REFERENCES Keepers
);

CREATE TABLE Species (
speciesID INT,
speciesName VARCHAR(40),
genus VARCHAR(40),
animalCount INT,
PRIMARY KEY (speciesID)
);

CREATE TABLE Animals (
animalID INT,
name VARCHAR(30),
speciesID INT,
animalAge INT,
cageID INT,
PRIMARY KEY (animalID),
FOREIGN KEY (speciesID) REFERENCES Species,
FOREIGN KEY (cageID) REFERENCES Cages
);

CREATE TABLE Members (
memberID INT,
name VARCHAR(30),
address VARCHAR(40), 
memberStatus CHAR (1),
joinDate DATE,
expirationDate DATE,
PRIMARY KEY (memberID)
);

CREATE TABLE CageVisits (
memberID INT,
cageID INT,
visitDate Date,
likedVisit Boolean,
PRIMARY KEY (memberID, cageID, visitDate),
FOREIGN KEY (memberID) REFERENCES Members,
FOREIGN KEY (cageID) REFERENCES Cages
);
