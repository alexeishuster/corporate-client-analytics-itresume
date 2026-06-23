-- =====================================================
-- File: 02_difficult_tasks.sql
-- Purpose: Identify tasks with high failure rates
-- Input: CodeSubmit, Users, Problem tables
-- Output: Task name, attempt count, failure rate %
-- =====================================================

WITH attempts AS (
  SELECT 
    COUNT(DISTINCT c.created_at) AS attempt_cnt,
    c.problem_id,
    SUM(c.is_false) AS failed_attempts
  FROM CodeSubmit c
  JOIN Users u ON c.user_id = u.id
  WHERE u.company_id = 1
  GROUP BY c.problem_id
  HAVING COUNT(DISTINCT c.created_at) > 30
)
SELECT
  attempt_cnt,
  p.name AS task_name,
  failed_attempts,
  ROUND((failed_attempts * 1.0) / (attempt_cnt * 1.0) * 100.0, 2) AS failed_attempts_pct
FROM attempts
JOIN Problem p ON attempts.problem_id = p.id
ORDER BY failed_attempts_pct DESC;