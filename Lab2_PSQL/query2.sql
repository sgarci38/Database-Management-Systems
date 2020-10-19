 --query2
-- Output: name, address and CageID 
-- Tables: members,CageVisits
-- Join: memberID 
-- we have to output the name address of member and the cageId 
-- of the cage they visited if they like it or if true 
SELECT m.name, m.address, c.cageID
FROM Members m , Cagevisits c
WHERE m.memberID = c.memberID
AND c.likedVisit = 't';
