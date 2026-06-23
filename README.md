# corporate client analytics itresume
SQL analysis of corporate client engagement, task difficulty, and student performance for an educational platform
# 📊 Corporate Client Analytics Platform

## 📌 Business Problem

**ITResume** is an educational platform providing corporate training subscriptions. The company needed to:
1. Identify tasks where students struggle (for curriculum improvement)
2. Find students who need additional help (for teacher intervention)
3. Measure platform engagement (MAU) to justify subscription renewal (for HR & Finance)

**Stakeholders:**
- **Methodologists** → Improve difficult learning modules
- **Teachers** → Provide targeted help to struggling students
- **Account Managers & HR Directors** → Justify subscription ROI

---

## 🎯 Goals & Hypotheses

### Goals
1. Calculate Monthly Active Users (MAU) to track platform engagement
2. Identify the most difficult tasks (>60% failure rate) for curriculum review
3. Segment students by performance to enable proactive intervention

### Hypotheses
1. **Hypothesis 1:** Student activity is not uniform and may drop towards year-end due to workload
2. **Hypothesis 2:** Some tasks have significantly higher failure rates, indicating unclear materials

---

## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Query Language:** SQL (CTEs, JOINs, aggregations, CASE WHEN, date functions)
- **Analysis:** Cohort analysis, retention metrics, performance segmentation
- **Visualization:** Charts for MAU trends, task difficulty distribution

---

## 📊 Key Insights

### 1. MAU Analysis (Monthly Active Users)
- **Peak activity:** December 2021 (54 users) and April 2022 (56 users)
- **Lowest activity:** August 2021 (2 users) — platform launch phase
- **Trend:** Activity remains stable at 30-50 users/month after initial growth
- **Conclusion:** ✅ Hypothesis 1 **rejected** — no significant drop at year-end; activity is consistent

### 2. Difficult Tasks Analysis
- **Top 3 most difficult tasks** (>80% failure rate):
  1. "Python. HW 11: Named and positional arguments" — **90.74% failure rate** (54 attempts)
  2. "Python. HW 7: Dictionary expansion" — **87.04% failure rate** (54 attempts)
  3. "Python. HW 2: Multi-line strings" — **82.02% failure rate** (89 attempts)
- **Pattern:** Python basics (strings, dictionaries, functions) are the biggest pain points
- **Conclusion:** ✅ Hypothesis 2 **confirmed** — specific modules need curriculum revision

### 3. Student Performance Segmentation
- **Total students analyzed:** 100+
- **Status distribution:**
  - **"Dropped out"** (no activity for 14+ days): **95% of students**
  - **"Struggling"** (<30% success rate): **0%**
  - **"On track"** (normal performance): **5% of students**
- **Key finding:** Massive churn — only 5% of students remain active
- **Action needed:** Urgent re-engagement campaign for "dropped out" students

---

## 💡 Business Recommendations

### For Methodologists (Curriculum Team)
1. **Revise Python basics modules** — add more examples, hints, and step-by-step explanations for:
   - Named/positional arguments (90.74% failure)
   - Dictionary operations (87.04% failure)
   - String manipulation (82.02% failure)
2. **Add interactive hints** for tasks with >60% failure rate
3. **Conduct additional workshops** on Python fundamentals

### For Account Managers
1. **Automate monthly MAU reports** and send to client's HR director
2. **Visualize platform value** — show engagement trends to justify subscription renewal
3. **Set alert threshold:** If MAU drops below 15 users, proactively contact HR to understand reasons (vacations, workload)

### For Teachers
1. **Implement 48-hour response rule:** If a student gets "Struggling" or "Dropped out" status, teacher must contact them within 48 hours
2. **Offer personalized help:** Provide additional materials or 1-on-1 sessions for students with <30% success rate
3. **Motivate inactive students:** Send encouraging emails to "Dropped out" segment

---

## 📈 SQL Queries Overview

### Query 1: MAU Analysis
- **Purpose:** Track monthly active users to measure platform engagement
- **Techniques:** `DATE_TRUNC`, `COUNT DISTINCT`, `GROUP BY`
- **Output:** Monthly active user count

### Query 2: Difficult Tasks Identification
- **Purpose:** Find tasks with >60% failure rate for curriculum improvement
- **Techniques:** CTEs, `JOIN`, `SUM`, `ROUND`, `HAVING`
- **Output:** Task name, attempt count, failure rate %

### Query 3: Student Performance Segmentation
- **Purpose:** Identify students who need help vs. high performers
- **Techniques:** `LEFT JOIN`, `CASE WHEN`, `MAX`, date arithmetic
- **Output:** Student name, total/successful submissions, last login, status

---

## 📂 Project Structure
sql/

- 01_mau_analysis.sql -- Monthly active users calculation
- 02_difficult_tasks.sql -- Task failure rate analysis
- 03_student_performance.sql -- Student segmentation

results/

- mau_results.csv -- MAU data for visualization
- difficult_tasks_results.csv -- Task difficulty metrics
- student_performance_results.csv -- Student status breakdown

images/

- metabas dashboard

