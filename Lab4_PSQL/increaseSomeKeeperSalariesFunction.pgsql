-- stored function 

CREATE OR REPLACE FUNCTION increaseSomeKeeperSalariesFunction(maxIncreaseAmount INTEGER) 
RETURNS INTEGER AS $$
    -- increase is the value that will be returned
    -- counter keeps count of the salarys that have been Increased       
    -- increaseAmount keeps track that a keeper whos level is A gets a $10 increse and so on 
    DECLARE increase INTEGER;
    newSalary NUMERIC(7,2);
    sum INTEGER;
    increaseAmount INTEGER;
    increaseSalary INTEGER;
    -- create cursor to encapsulate query and go thru the rows
    keeper CURSOR FOR
    -- creating query to select only needed data 
        SELECT k.keeperID, k.hireDate, k.keeperLevel, k.keeperSalary
        FROM Keepers k
        WHERE k.keeperLevel IN ('A','B','C')
        AND k.keeperSalary IS NOT NULL
        ORDER BY k.keeperLevel, k.hireDate;

    -- Declaring new Variables to store keeperID, hireDate, keeperLevel and keeper from query above
    nkeeperID INTEGER; -- do we put IS NOT NULL
    nhireDate DATE; -- do i have to put  IS NOT NULL?
    nkeeperLevel CHAR(1);
    nkeeperSalary NUMERIC(7,2);

    BEGIN
        increase = 0;
        increaseSalary = 0; --counter
       
        OPEN keeper; -- open cursor 
        LOOP 
            FETCH keeper INTO nkeeperID, nhireDate, nkeeperLevel, nkeeperSalary; -- store data of the selected attributes in into the new declared variables
            EXIT WHEN NOT FOUND OR increaseSalary >= maxIncreaseAmount; -- exit condition, should we exit when the its equal or greater?
            -- seting the keeper Level to the designate increase amount 
            CASE nkeeperLevel
                WHEN 'A' THEN increaseAmount = 10;
                WHEN 'B' THEN increaseAmount = 20;
                WHEN 'C' THEN increaseAmount = 30;
            END CASE;

            newSalary = nkeeperSalary+increaseAmount; -- will be adding the designated amount to the keepers salary
            increaseSalary = increaseSalary + increaseAmount; -- keeping count of the sum of the increase amounts
            -- the if condition makes sure that as long as the sum is less than or equal to the amount allowed it will keep updating tupels
            IF increaseSalary <= maxIncreaseAmount THEN
                increase = increaseSalary; -- the sum will be set to increase that will be returned
                UPDATE Keepers
                SET keeperSalary = newSalary
                WHERE keeperID = nkeeperID;
            END IF;

        END LOOP;
    CLOSE keeper;
    RETURN increase;

    END
$$ LANGUAGE plpgsql;
        

         