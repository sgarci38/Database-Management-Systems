-- create 
CREATE VIEW viewComputedCount AS
SELECT a.speciesID, COUNT(*) AS computedAnimalCount
FROM Animals a, Species s
WHERE a.speciesID = s.speciesID
GROUP BY a.speciesID
HAVING COUNT(*) >= 3;

