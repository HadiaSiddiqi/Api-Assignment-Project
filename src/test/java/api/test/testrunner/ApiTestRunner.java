package api.test.testrunner;

import com.intuit.karate.junit5.Karate;

public class ApiTestRunner {
	@Karate.Test
	public Karate runTest(){
		return Karate.run("classpath:features")
				.tags("@EndToEnd");
	}
}
