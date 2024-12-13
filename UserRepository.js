const pool = require('./db');

class UserRepository {
  static async bulkInsertOrUpdateUsers(users) {
    if (!users || users.length === 0) return;

    const values = [];
    users.forEach(u => {
      values.push(u.slack_user_id, u.name);
    });

    const sql = `
      INSERT INTO users (slack_user_id, name)
      VALUES ${users.map(() => '(?,?)').join(',')}
      ON DUPLICATE KEY UPDATE
        name = VALUES(name),
        updated_at = CURRENT_TIMESTAMP
    `;

    const [result] = await pool.query(sql, values);
    return result;
  }

  static async getAllUsers() {
    const sql = `SELECT id, slack_user_id, name FROM users`;
    const [rows] = await pool.query(sql);
    return rows;
  }
}

module.exports = UserRepository;
