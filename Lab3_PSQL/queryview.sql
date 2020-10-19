--view

select s.speciesID, s.speciesName, s.animalCount, v.computedAnimalCount
From Species s, viewComputedCount v
Where s.animalCount <> v.computedAnimalCount 
    AND s.speciesID = v.speciesID;

-- before delete 
--speciesid|speciesname|animalcount|computedanimalcount
--      404|lion       |          2|                  3
--      405|panther    |          0|                  4
--      407|small cat  |          2|                  4

DELETE FROM Animals
WHERE animalId = 10014;

DELETE FROM Animals
WHERE animalId = 10015;

-- after delete 
--speciesid|speciesname|animalcount|computedanimalcount
--      401|tiger      |          4|                  3
--      405|panther    |          0|                  4
--      407|small cat  |          2|                  4

-- They are different. AnimalID 10014 corresponds to the speciesID 404
-- AnimalID 10015 corresponds to the speciesID 401. When deleted specid 401 no longer
-- matches with its computeAnimal count of 4 so it now appears on the table
-- speciesID 404 on the other hand does so it no longer appears on the table



