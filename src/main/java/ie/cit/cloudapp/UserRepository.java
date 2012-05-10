package ie.cit.cloudapp;

import java.util.ArrayList;
import java.util.List;

public class UserRepository {
	private List<User> users = new ArrayList<User>();
	
	public List<User> getUsers() {
		return users;
	}
	
	public void addUser(User user) {
		users.add(user);
	}

}
