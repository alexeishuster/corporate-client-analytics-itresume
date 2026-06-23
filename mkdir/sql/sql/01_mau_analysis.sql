-- =====================================================
-- File: 01_mau_analysis.sql
-- Purpose: Calculate Monthly Active Users (MAU)
-- Input: Users, UserEntry tables
-- Output: Monthly active student count
-- =====================================================

SELECT 
    DATE_TRUNC('month', ue.entry_at) AS active_month,
    COUNT(DISTINCT ue.user_id) AS active_students_cnt
FROM Users u
JOIN UserEntry ue ON u.id = ue.user_id
WHERE u.company_id = 1
GROUP BY DATE_TRUNC('month', ue.entry_at)
ORDER BY active_month;
