package service;

import static utils.CloseableUtil.*;
import static utils.DBUtil.*;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Connection;

import utils.CipherUtil;
import utils.StreamUtil;
import beans.User;
import dao.UserDao;

public class UserService {

	public void register(User user) {

		Connection connection = null;
		try {
			connection = getConnection();

			String encPassword = CipherUtil.encrypt(user.getPassword());
			user.setPassword(encPassword);

			setDefaultIcon(user);

			UserDao userDao = new UserDao();
			userDao.insert(connection, user);

			commit(connection);
		} catch (RuntimeException e) {
			rollback(connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}

	private void setDefaultIcon(User user) {

		InputStream is = null;
		try {
			long randomNum = System.currentTimeMillis() % 5;
			String filePath = "/duke_" + randomNum + ".jpg";
			is = UserService.class.getResourceAsStream(filePath);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			StreamUtil.copy(is, baos);
			user.setIcon(baos.toByteArray());
		} finally {
			close(is);
		}
	}

	public void update(User user) {

		Connection connection = null;
		try {
			connection = getConnection();

			String encPassword = CipherUtil.encrypt(user.getPassword());
			user.setPassword(encPassword);

			UserDao userDao = new UserDao();
			userDao.update(connection, user);

			commit(connection);
		} catch (RuntimeException e) {
			rollback(connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}

	public User getUser(int userId) {

		Connection connection = null;
		try {
			connection = getConnection();

			UserDao userDao = new UserDao();
			User user = userDao.getUser(connection, userId);

			commit(connection);

			return user;
		} catch (RuntimeException e) {
			rollback(connection);
			throw e;
		} catch (Error e) {
			rollback(connection);
			throw e;
		} finally {
			close(connection);
		}
	}

}
