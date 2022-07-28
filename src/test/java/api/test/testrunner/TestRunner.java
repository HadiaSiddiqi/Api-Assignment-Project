package api.test.testrunner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {
	// Karate testrunner class
	@Karate.Test
	public Karate runTest(){
		return Karate.run("classpath:features")
				.tags("@EndToEnd");
	}
}
