### Explanation

#### Problem Summary
The task is to find the names of all users and the total distance they have traveled. If a user hasn't taken any rides, their traveled distance should be `0`.

#### Approach
To solve this problem, we need to:
1. **Identify Key Tables**:
   - `Users`: Contains user IDs (`id`) and names (`name`).
   - `Rides`: Contains ride IDs (`id`), user IDs (`user_id`), and distances (`distance`).

2. **Handle Missing Data**:
   - Not all users may have rides in the `Rides` table. To include users with no rides, we use a **`LEFT JOIN`**:
     - `LEFT JOIN` ensures all users are included in the result, even if there is no matching data in the `Rides` table.

3. **Aggregate Data**:
   - Use the SQL `SUM()` function to calculate the total distance traveled by each user.
   - Use `IFNULL()` to handle `NULL` values for users without rides by replacing `NULL` with `0`.

4. **Grouping and Sorting**:
   - Group data by user ID and name using `GROUP BY`.
   - Sort the results by:
     - **Traveled Distance** (`DESC`): Highest distance first.
     - **Name** (`ASC`): Alphabetical order for ties.

---

#### SQL Query
```sql
SELECT 
    u.name,
    IFNULL(SUM(r.distance), 0) AS Travelled_Distance
FROM 
    Users u
LEFT JOIN 
    Rides r
ON 
    u.id = r.user_id
GROUP BY 
    u.id, u.name
ORDER BY 
    Travelled_Distance DESC,
    u.name ASC;
