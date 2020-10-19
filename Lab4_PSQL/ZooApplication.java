import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the Zoo database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class ZooApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public ZooApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection() // method 
    {
        return connection;
    }

    /**
     * getMemberStatusCount: This method has a string argument called theMemberStatus, and
     * returns the number of Keepers whose keeperLevel equals theMemberStatus.
     * A value of theMemberStatus that’s not ‘L’, ‘M’ or ‘H’ (corresponding to Low, Medium, and
     * High) is an error.
     */
    // method that has a parameter theMemberStatus
    public Integer getMemberStatusCount(String theMemberStatus) throws SQLException
    {
        Integer result = 0;
        // your code here
        if (!(theMemberStatus.equals("L") || theMemberStatus.equals("M") || theMemberStatus.equals("H")))
        {
            System.out.println("MemeberStatus entered  to be L, M, H"); // error message if user inputs invalid MemberStatus
            System.exit(-1);
        }
        try
        {
                String query = "select count(*) from members where memberstatus = ?"; // ? is a place holder 
                PreparedStatement statement = connection.prepareStatement(query); // passing the query 
                                        statement.setString(1,theMemberStatus); // replacing place holder with value we later give in the run file 
                                        statement.executeQuery();
                ResultSet resultSet = statement.getResultSet();
                resultSet.next();
                result = resultSet.getInt(1);
                resultSet.close();
                statement.close();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            System.out.println("Database error!");
        }


        // end of your code
        return result;
    }


    /**
     * updateMemberAddress:  Sometimes a member changes address.  The updateMemberAddress method
     * has two arguments, an integer argument theMemberID, and a string argument,
     * newMemberAddress.  For the tuple in the Members table (if any) whose memberID equals
     * theMemberID, updateMemberAddress should update the address to be newMemberAddress.
     * (Note that there might not be any tuples whose memberID matches theMemberID.)
     *
     * updateMemberAddress should return the number of tuples that were updated, which will
     * always be 0 or 1.
     */

    public int updateMemberAddress(int theMemberID, String newMemberAddress)
    {
        // your code here; return 0 appears for now to allow this skeleton to compile.
        int result = 0;
         try
         {
            String query = "UPDATE Members SET address = '"+newMemberAddress+"' WHERE  memberID = "+ theMemberID+";";
            PreparedStatement statement = connection.prepareStatement (query);
            statement.execute();
            result = statement.getUpdateCount ();
            statement.close();
         }
         catch (SQLException e)
         {
            e.printStackTrace();  
            System.exit(-1);
         }

            return result;
        // end of your code
    }


    /**
     * increaseSomeKeeperSalaries: This method has an integer parameter, maxIncreaseAmount.
     * It invokes a stored function increaseSomeKeeperSalariesFunction that you will need to
     * implement and store in the database according to the description in Section 5.
     * increaseSomeKeeperSalariesFunction should have the same parameter, maxIncreaseAmount.
     * A value of maxIncreaseAmount that’s not positive is an error.
     *
     * The Keepers table has a keeperSalary attribute, which gives the salary (in dollars and
     * cents) for each keepers.  increaseSomeKeeperSalariesFunction will increase the salary
     * for some (but not necessarily all) keepers; Section 5 explains which keepers should have
     * their salaries increased, and also tells you how much they should be increased.
     * The increaseSomeKeeperSalaries method should return the same integer result that the
     * increaseSomeKeeperSalariesFunction stored function returns.
     *
     * The increaseSomeKeeperSalaries method must only invoke the stored function
     * increaseSomeKeeperSalariesFunction, which does all of the assignment work; do not
     * implement the increaseSomeKeeperSalaries method using a bunch of SQL statements through
     * JDBC.
     */

    public int increaseSomeKeeperSalaries (int maxIncreaseAmount)
    {
        // There's nothing special about the name storedFunctionResult
        int storedFunctionResult = 0;

        // your code here
        if(maxIncreaseAmount <=0)
        {
            System.out.println("Must Enter A Number Greater or Equal To Zero"); 
            System.exit(-1);  
        }
        try 
        {
            String query = "SELECT increaseSomeKeeperSalariesFunction(?)";
            PreparedStatement statement = connection.prepareStatement(query); // passing the query
            statement.setInt(1,maxIncreaseAmount); // set first perameter ?
            statement.executeQuery();
            ResultSet resultSet = statement.getResultSet();
            if (resultSet.next())
            storedFunctionResult = resultSet.getInt(1); // first integer
        }

        catch(SQLException e)
        {
            e.printStackTrace();
            
        }
        // end of your code
        return storedFunctionResult;

    }

};
