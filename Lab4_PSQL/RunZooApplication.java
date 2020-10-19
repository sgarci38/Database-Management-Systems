import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the ZooApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunZooApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username (twice) and password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cse182-db.lt.ucsc.edu/sgarci37",
                                                     "sgarci37",
                                                     "Fetaavocado25");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the ZooApplication class.
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
				// creating a variable app that will help me connect with zooApplication and call my functions
				ZooApplication app = new ZooApplication(connection);
				//Output of getMemberStatusCount
                String memberstatus="H";
                Integer membersCount = app.getMemberStatusCount(memberstatus);
				System.out.println("Output of getMemberStatusCount when the parameter theMemberStatus is ‘H’ "+membersCount);

				// Output of updateMemberAddress 
				
				Integer theMemberID = 1006;
				String newMemberAddress = "200 Rocky Road";
				Integer updateResult = app.updateMemberAddress(theMemberID, newMemberAddress);
				System.out.println("Output of updateMemberAddress when theMemberID is 1006 and newMemberAddress is ‘200 Rocky Road’ " +updateResult);

				theMemberID = 1011;
				newMemberAddress = "300 Rocky Road";
				updateResult = app.updateMemberAddress(theMemberID, newMemberAddress);
				System.out.println("Output of updateMemberAddress when theMemberID is 1011 and newMemberAddress is ‘300 Rocky Road’ " +updateResult);

				//Output of increaseSomeKeeperSalaries

				Integer incResult = app.increaseSomeKeeperSalaries(451);
				System.out.println("Output of the Function increaseSomeKeeperSalaries when maxIncreaseAmoun is 451 "+incResult);

				incResult = app.increaseSomeKeeperSalaries(132);
				System.out.println("Output of the Function increaseSomeKeeperSalaries when maxIncreaseAmoun is 132 "+incResult);
            
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
