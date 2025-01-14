## Problem: Trips and Users

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round the `Cancellation Rate` to two decimal points.

### Table: Trips

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| client_id   | int     |
| driver_id   | int     |
| city_id     | int     |
| status      | enum    |
| request_at  | varchar |

- `id` is the primary key (column with unique values) for this table.
- The table holds all taxi trips. Each trip has a unique `id`, while `client_id` and `driver_id` are foreign keys to the `users_id` at the `Users` table.
- `status` is an ENUM type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').

### Table: Users

| Column Name | Type    |
|-------------|---------|
| users_id    | int     |
| banned      | enum    |
| role        | enum    |

- `users_id` is the primary key (column with unique values) for this table.
- The table holds all users. Each user has a unique `users_id`, and `role` is an ENUM type of ('client', 'driver', 'partner').
- `banned` is an ENUM type of ('Yes', 'No').

### Cancellation Rate Formula

The cancellation rate is computed by dividing the number of cancelled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

---

### Example

**Input:**

**Trips Table:**

| id  | client_id | driver_id | city_id | status              | request_at |
|-----|-----------|-----------|---------|---------------------|------------|
| 1   | 1         | 10        | 1       | completed           | 2013-10-01 |
| 2   | 2         | 11        | 1       | cancelled_by_driver | 2013-10-01 |
| 3   | 3         | 12        | 6       | cancelled_by_client | 2013-10-02 |
| 4   | 4         | 13        | 6       | completed           | 2013-10-02 |

**Users Table:**

| users_id | banned | role    |
|----------|--------|---------|
| 1        | No     | client  |
| 2        | No     | client  |
| 3        | No     | client  |
| 4        | Yes    | client  |
| 10       | No     | driver  |
| 11       | No     | driver  |
| 12       | Yes    | driver  |
| 13       | No     | driver  |

**Output:**

| Day         | Cancellation Rate |
|-------------|-------------------|
| 2013-10-01  | 0.50              |
| 2013-10-02  | 0.00              |

**Explanation:**
- On 2013-10-01, there were 2 trips, and 1 was cancelled, so the cancellation rate is 0.50.
- On 2013-10-02, there was 1 trip, and none were cancelled, so the cancellation rate is 0.00.
