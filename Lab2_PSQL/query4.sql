--/ query 4
--Output: memberID, name--
-- tables combo trial 1: members, cageVisits, animals

SELECT DISTINCT m.memberID, m.name
FROM members m, cageVisits c, animals a, species s
WHERE m.memberID = c.memberID AND c.cageID = a.cageID 
and  a.speciesid = s.speciesid 
AND m.name LIKE '%th' and  s.speciesname = 'lion';


/*SELECT DISTINCT m.memberID, m.name
FROM Members m
INNER JOIN
CageVisits cv 
ON
 m.memberID = cv.memberID
INNER JOIN
    (SELECT 
        a.cageID
    FROM
        Animals a
    INNER JOIN
        Species s
    ON 
        a.speciesid = s.speciesid 
    AND
        s.speciesname = 'lion') l
ON cv.cageID = l.cageID
AND m.name LIKE '%th';


SELECT DISTINCT m.memberID, m.name
FROM Members m
INNER JOIN
CageVisits cv 
ON
 m.memberID = cv.memberID
INNER JOIN
    (SELECT 
        a.cageID, s.speciesname
    FROM
        Animals a
    INNER JOIN
        Species s
    ON 
        a.speciesid = s.speciesid) AS secondJoin
ON cv.cageID = secondJoin.cageID
AND secondJoin.speciesname = 'lion'
AND  m.name LIKE '%th'; */


