package team6.connection;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class DbConnectionTest {
		
	@Test
	public void connectionIsAvailable() {
		assertTrue(DbConnection.getInstance() != null);
	}

}
