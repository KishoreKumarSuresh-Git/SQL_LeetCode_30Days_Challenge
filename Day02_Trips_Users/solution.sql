SELECT
    t.request_at AS Day,
    ROUND(SUM(CASE 
                 WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1
                 ELSE 0
              END) / COUNT(*), 2) AS 'Cancellation Rate'
FROM
    Trips t
JOIN
    Users u ON t.client_id = u.users_id AND u.banned = 'No'
JOIN
    Users v ON t.driver_id = v.users_id AND v.banned = 'No'
WHERE
    t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY
    t.request_at
ORDER BY
    t.request_at;
