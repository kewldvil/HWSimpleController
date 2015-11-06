package com.simple.app.userserviceimplement;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.simple.app.entities.UserDto;
import com.simple.app.service.IUserService;

@Repository
public class UserDao implements IUserService {
	@Autowired
	private DataSource dataSource;

	@Override
	public boolean insertUser(UserDto S) {
		String sql = "INSERT INTO tbuser(username,email,password,birthdate,registerdate,image) VALUES(?,?,?,?,?,?)";
		UserDto s = null;
		try (Connection con = dataSource.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {
			ps.setString(1, s.getUsername());
			ps.setString(2, s.getEmail());
			ps.setString(3, s.getPassword());
			ps.setDate(4, s.getBirthdate());
			ps.setDate(5, s.getRegisterDate());
			ps.setString(6, s.getImageURL());
			if(ps.execute()){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateUser(UserDto users) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public ArrayList<UserDto> listUser() {
		String sql = "SELECT id,username,email,password,birthdate,registerdate,image FROM tbuser";
		ArrayList<UserDto> arr = new ArrayList<UserDto>();
		UserDto s = null;
		try (Connection con = dataSource.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new UserDto();
				s.setId(rs.getInt("id"));
				s.setUsername(rs.getString("username"));
				s.setEmail(rs.getString("email"));
				s.setPassword(rs.getString("password"));
				s.setBirthdate(rs.getDate("birthdate"));
				s.setRegisterDate(rs.getDate("registerDate"));
				s.setImageURL(rs.getString("image"));
				arr.add(s);
			}
			return arr;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public UserDto getStudentById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
