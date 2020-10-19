--query 5
--Output animalID,cageID, animalAge,keeperID
-- a) Table - species
--b) Table -species
--c) Table keeper
-- the keeper of that animal’s cage was hired between 
-- January 2,2019 and December 30,2019 (including those	dates)
-- find keeper with the hire dates


SELECT DISTINCT a.animalID AS theAnimalID, c.cageID AS theCageID, a.animalAge AS theAge, k.KeeperID AS theKeeperID, k.hireDate AS theHireDate
From Keepers k, Cages c, Species s, Animals a, Members m, CageVisits cv
WHERE k.KeeperID = c.KeeperID
   AND c.cageID = a.cageID
   AND c.cageID = cv.cageID
   AND a.speciesID = s.speciesID
   AND cv.memberID = m.memberID
   AND s.speciesName LIKE '%a%'
   AND s.genus IS NOT NULL
   AND k.hiredate >= DATE '01/02/19' 
   AND k.hiredate <= DATE '12/30/19'
   AND likedVisit = 'f';