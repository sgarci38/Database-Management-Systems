--general
 Alter Table Species
 ADD CONSTRAINT ani 
 CHECK (animalCount >= 0);

 Alter Table Members
 ADD 
 CHECK (joinDate < expirationDate);

 Alter Table Keepers
 ADD 
 CHECK ((keeperLevel is not null) or keeperSalary is NULL);
