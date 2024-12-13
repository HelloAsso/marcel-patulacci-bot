const pool = require('./db');

class ProgressionRepository {
  static async getUserProgression(userId) {
    const sql = `
      SELECT course_id, current_step
      FROM progression
      WHERE user_id = ?
      ORDER BY updated_at DESC
      LIMIT 1
    `;
    const [rows] = await pool.query(sql, [userId]);
    return rows.length > 0 ? rows[0] : null;
  }

  static async upsertProgression(userId, courseId, currentStep) {
    const sql = `
      INSERT INTO progression (user_id, course_id, current_step, started_at, updated_at)
      VALUES (?, ?, ?, NOW(), NOW())
      ON DUPLICATE KEY UPDATE
        current_step = VALUES(current_step),
        updated_at = NOW()
    `;
    const [result] = await pool.query(sql, [userId, courseId, currentStep]);
    return result;
  }
}

module.exports = ProgressionRepository;
