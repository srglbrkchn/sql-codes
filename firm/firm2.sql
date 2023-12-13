CREATE TABLE orders(
	orderID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    orderDate DATE NOT NULL,
	amount INT NOT NULL
);

select * from orders;

SELECT LPAD(MONTH(orderDate), 2, '0') AS month, SUM(amount) AS total_amount
from orders
GROUP BY month;


