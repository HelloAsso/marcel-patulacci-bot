const pool = require('./db');

class CourseRepository {
  static async getCourseSteps(courseId) {
    const sql = `
      SELECT id, type, content, answers, correct_answer
      FROM course_steps
      WHERE course_id = ?
      ORDER BY step_order ASC
    `;
    const [rows] = await pool.query(sql, [courseId]);
    return rows;
  }

  static async getCourse(courseId) {
    const sql = `SELECT id, title FROM courses WHERE id = ?`;
    const [rows] = await pool.query(sql, [courseId]);
    return rows.length > 0 ? rows[0] : null;
  }

  static async getNextCourse(courseId) {
    const sql = `SELECT id, title FROM courses WHERE id > ? ORDER BY id ASC LIMIT 1`;
    const [rows] = await pool.query(sql, [courseId]);
    return rows.length > 0 ? rows[0] : null;
  }
}

module.exports = CourseRepository;
