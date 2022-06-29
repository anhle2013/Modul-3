package com.cg.service;

import com.cg.dto.UserDTO;
import com.cg.model.User;
import com.cg.utils.MySQLConnUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    private static String SELECT_ALL_USERS = "" +
            "SELECT " +
                "u.id, " +
                "u.full_name, " +
                "u.age, " +
                "u.phone, " +
                "u.address, " +
                "c.name, " +
                "u.status " +
            "FROM users AS u " +
            "JOIN cities AS c " +
            "ON u.city_id = c.id " +
            "ORDER BY u.id;";

    private static String INSERT_USER = "INSERT INTO users (`full_name`, `age`, `phone`,`city_id`, `address`)" +
                                        "VALUES (?,?,?,?,?);";

    private static String SELECT_USER_BY_ID = "SELECT " +
                                                "u.id," +
                                                "u.full_name," +
                                                "u.phone," +
                                                "u.address " +
                                            "FROM users AS u " +
                                            "WHERE u.id = ?;";

    private static String UPDATE_USER = "UPDATE users " +
                                        "SET `full_name` = ?," +
                                            "`phone` = ?," +
                                            "`address` = ?," +
                                            "`city_id` = ?," +
                                            "`age` = ? " +
                                        "WHERE `id` = ?;";

    private static String DISABLE_USER = "UPDATE users SET `status` = 'disable' WHERE `id` = ?;";

    private static String RE_ACTIVE_USER = "UPDATE users SET `status` = 'active' WHERE `id` = ?;";

    private static String SEARCH_USERS = "" +
            "SELECT " +
                "u.id, " +
                "u.full_name, " +
                "u.age, " +
                "u.phone, " +
                "u.address, " +
                "c.name, " +
                "u.status " +
            "FROM users AS u " +
            "JOIN cities AS c " +
            "ON u.city_id = c.id ";

    @Override
    public User selectUserById (int userId) {
        User user = null;

        try {
            Connection connection = MySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int city_id = rs.getInt("city_id");
                int age = rs.getInt("age");
                user = new User(id, fullName, phone, address, city_id, age);
            }
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return user;
    }

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        try {
            Connection connection = MySQLConnUtils.getConnection();
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int cityId = rs.getInt("cityId");
                int age = rs.getInt("age");
                String status = rs.getString("status");
                userList.add(new User(id, fullName, phone, address, cityId, age,status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<UserDTO> findAllUserDTO() {
        List<UserDTO> userList = new ArrayList<>();

        try {
            Connection connection = MySQLConnUtils.getConnection();

            PreparedStatement statement = connection.prepareCall(SELECT_ALL_USERS);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String cityName = rs.getString("name");
                int age = rs.getInt("age");
                String status = rs.getString("status");

                userList.add(new UserDTO(id, fullName, age, phone, cityName, address, status));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    @Override
    public List<UserDTO> findUsersDTO(String query) {
        List<UserDTO> userList = new ArrayList<>();

        try {
            Connection connection = MySQLConnUtils.getConnection();
            String fullQuery = SEARCH_USERS + query;
            System.out.println(fullQuery);
            PreparedStatement statement = connection.prepareCall(fullQuery);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String fullName = rs.getString("full_name");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String cityName = rs.getString("name");
                int age = rs.getInt("age");
                String status = rs.getString("status");

                userList.add(new UserDTO(id, fullName, age, phone, cityName, address, status));
            }

        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return userList;
    }

    @Override
    public boolean create(User user) {
        boolean success = false;
        try {
            Connection connection = MySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER);
            //preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setInt(2, user.getAge());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setInt(4, user.getCityId());
            preparedStatement.setString(5, user.getAddress());

            preparedStatement.execute();
            success = true;
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return success;
    }

    @Override
    public boolean update(User user) {
        boolean success = false;
        try {
            Connection connection = MySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            System.out.println(UPDATE_USER);
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getPhone());
            preparedStatement.setString(3, user.getAddress());
            preparedStatement.setInt(4, user.getCityId());
            preparedStatement.setInt(5, user.getAge());
            preparedStatement.setInt(6, user.getId());
            preparedStatement.execute();
            success = true;
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return success;
    }

    @Override
    public boolean remove(int id) {
        boolean success = false;
        try {
            Connection connection = MySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DISABLE_USER);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
            success = true;
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return success;
    }

    @Override
    public boolean reActive(int id) {
        boolean success = false;
        try {
            Connection connection = MySQLConnUtils.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(RE_ACTIVE_USER);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
            success = true;
        } catch (SQLException e) {
            MySQLConnUtils.printSQLException(e);
        }
        return success;
    }
}
