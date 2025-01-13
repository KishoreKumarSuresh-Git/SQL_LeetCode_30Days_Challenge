## Problem: Top Travellers
Write a query to find the top travellers and their total travel distance.

### Table: Users

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| name        | varchar |

- `id` is the column with unique values for this table.
- `name` is the name of the user.

### Table: Rides

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| user_id     | int     |
| distance    | int     |

- `id` is the column with unique values for this table.
- `user_id` is the id of the user who traveled the distance "distance".

---

### Task
Write a solution to report the distance traveled by each user.

- Return the result table ordered by `travelled_distance` in **descending order**.
- If two or more users traveled the same distance, order them by their `name` in **ascending order**.

The result format is shown in the following example.

---

### Example 1:

**Input:**

Users table:
| id | name      |
|----|-----------|
| 1  | Alice     |
| 2  | Bob       |
| 3  | Alex      |
| 4  | Donald    |
| 7  | Lee       |
| 13 | Jonathan  |
| 19 | Elvis     |

Rides table:
| id | user_id | distance |
|----|---------|----------|
| 1  | 1       | 120      |
| 2  | 2       | 317      |
| 3  | 3       | 222      |
| 4  | 7       | 100      |
| 5  | 13      | 312      |
| 6  | 19      | 50       |
| 7  | 7       | 120      |
| 8  | 19      | 400      |
| 9  | 7       | 230      |

**Output:**

| name      | travelled_distance |
|-----------|--------------------|
| Elvis     | 450                |
| Lee       | 450                |
| Bob       | 317                |
| Jonathan  | 312                |
| Alex      | 222                |
| Alice     | 120                |
| Donald    | 0                  |

**Explanation:**
- Elvis and Lee traveled 450 miles, but Elvis is the top traveler as his name is alphabetically smaller than Lee.
- Bob, Jonathan, Alex, and Alice each have one ride, and we order them by their total distances.
- Donald did not take any rides, so the distance traveled by him is `0`.

**Link to the problem**: (https://leetcode.com/problems/top-travellers/description/)
