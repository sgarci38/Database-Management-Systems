--query3
--Output: keeperID, name, keeperSalary
--Tables: Keepers,Cages, Animals, species

--speciesID for tiger = 401
--speciesID for lion is =404 
--for the given data cage 201, 204, 


SELECT DISTINCT k.KeeperID, k.name, k.keeperSalary
FROM Keepers k, Cages c, Animals a1, Animals a2, Species s1, Species s2
WHERE k.keeperID = c.keeperID
    AND c.cageID = a1.cageID
    AND c.cageID = a2.cageID
    AND a1.speciesID = s1.speciesID
    AND a2.speciesID = s2.speciesID
    AND s1.speciesName = 'lion'
    AND s2.speciesName = 'tiger'
ORDER BY k.keeperSalary DESC,
k.name ASC;




