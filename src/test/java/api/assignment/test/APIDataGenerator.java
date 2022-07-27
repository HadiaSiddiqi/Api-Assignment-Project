package api.assignment.test;

import java.text.SimpleDateFormat;

import java.util.Date;

import com.github.javafaker.Faker;


public class APIDataGenerator {

	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName()  + "@Yahoo.com";

	}

	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();

	}

	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();

	}

	public static String DateOfBirth() {
		Faker faker = new Faker();
		Date date = faker.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("YYY-MM-dd");
		return format.format(date);
	}
	
	public static String getNewId(){
		Faker faker = new Faker();
		return faker.idNumber().valid();
	}
	public static String getPhoneNumber(){
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();
}
	public static String getExtentsionphone(){
		Faker faker = new Faker();
		return faker.phoneNumber().extension();
	
	}
	public static String getState(){
		Faker faker = new Faker ();
			return faker.address().state();
		}
	
	
	public static String getStreetAdress(){
		Faker faker = new Faker ();
		return faker.address().streetName();
	}
	public static String getCity(){
		Faker faker = new Faker();
		return faker.address().cityName();
	}
	public static String getCountryCode(){
		Faker faker = new Faker();
		return faker.address().countryCode();
		
	}
	public static String getPostalCode(){
		Faker faker = new Faker ();
		return faker.address().zipCode();
		
		
	
	
	}
	public static String getTitle(){
		Faker faker = new Faker();
			return faker.name().title();
	}
	

	
public static void main (String args[]){
	System.out.println(getEmail());
}
}
