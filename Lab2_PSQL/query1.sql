--query 1 --
Select  A.animalID 
from Cages C, Animals A
where C.cagesector = 'N' 
AND C.cageID = A.cageID;