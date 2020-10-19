--combine
--AC: AnimalChanges (animalID, speciesID, cageID)
Begin TRANSACTION ISOLATION LEVEL SERIALIZABLE;

UPDATE Animals A
SET speciesID = AC.speciesID, cageID = AC.cageID
FROM AnimalChanges AC
WHERE A.animalID = AC.animalID;

INSERT INTO Animals
SELECT animalID,NULL,speciesID,NULL,cageID
FROM AnimalChanges AC
WHERE AC.animalID NOT IN (
    SELECT A.animalID
    FROM Animals A
);

COMMIT TRANSACTION;





