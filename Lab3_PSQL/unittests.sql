--test test 123 

---------------foreign.sql--------
-- Testing Foreign Key Constraint cageID
--fail because 208 is not a cageID in cages
INSERT Into CageVisits 
Values (1008,208, DATE '2019-02-14',TRUE);

-- Testing Foreign Key Constraint memberID
-- fail because 1010 is not a memberID in members table
INSERT Into CageVisits 
Values (1010,204, DATE '2020-02-14',TRUE);

---------------general.sql--------------
-- Testing the constraint animalCount >=0
 --succeed
Update Species 
SET animalCount = 2
Where speciesID = 405;
-- fail
Update Species 
SET animalCount = -1
Where speciesID = 407;

--Testing the constraint joinDate < expirationDate
--succeed 
Update Members 
SET expirationDate = Date '2022-02-01'
Where memberID = 1001;
-- fail 
Update Members 
SET expirationDate = Date '2019-02-01'
Where memberID = 1002;

--Testing the constrain if keeperLevel is NULL, then keeperSalary must also be NULL.
--succeed 
Update Keepers
SET keeperSalary = NUll
Where keeperID = 2;
--fail
Update Keepers
SET keeperSalary = 10
Where keeperID = 5;
