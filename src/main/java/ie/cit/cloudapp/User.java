package ie.cit.cloudapp;

public class User {
	private String firstName;
	private String surname;
	private String email;
	private boolean done;
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getSurname() {
		return surname;
	}
	
	public void setSurname(String surname) {
		this.surname = surname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean isDone(){
		return done;
	}
	
	public void setDone(boolean done) {
		this.done = done;
	}
	
}
