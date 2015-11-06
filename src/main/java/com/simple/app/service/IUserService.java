package com.simple.app.service;

import java.util.ArrayList;

import com.simple.app.entities.UserDto;

public interface IUserService {
	public boolean insertUser(UserDto users);
	public boolean updateUser(UserDto users);
	public boolean deleteUser(int id);
	public ArrayList<UserDto> listUser();
	public UserDto getStudentById(int id);
}
