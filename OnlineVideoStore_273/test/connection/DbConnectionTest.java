package connection;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import video.connection.DatabaseConnection;

public class DbConnectionTest {
		
	@Test
	public void connectionIsAvailable() {
		DatabaseConnection db = new DatabaseConnection();
		assertTrue(db.con != null);
	}

}
