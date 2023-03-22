# Project: Online Food Ordering System for Restaurant Staff
This project is an online food ordering system designed for restaurant staff to manage orders made by customers who dine in at the restaurant. The system allows staff to take and process orders, assign tables to customers, process payments, and manage employee accounts. Customers do not have access to the system; the system is intended for use only by restaurant staff.

## Getting Started:

To use this system, you need a web browser and internet connectivity.

### Prerequisites
+ Java 8 or higher
+ Apache Tomcat 9 or higher
+ MySQL 5.6 or higher
### Installation
+ Clone the repository to your local machine or server.
+ Import the database schema from db.sql file.
+ Configure the database connection settings in config.properties file.
+ Build the project using mvn clean install.
+ Deploy the generated WAR file in Tomcat server.
### Usage
1. Admin
The admin is responsible for adding new employee accounts, managing employee information, and managing the system's settings. To access the admin panel, go to http://localhost/admin and enter the login credentials.

2. Employee
The employees are the staff members who take orders from customers, assign tables to customers, process payments, and manage customer and order information. Employees need to log in to the system before they can access the orders page.

### Features
+ Secure login system for employees and admin
+ Table management system for assigning tables to customers
+ Order management system for tracking and processing orders
+ Payment system for processing payments
+ Menu management system for adding, deleting, and updating meals
+ Employee management system for adding, deleting, and updating employee accounts
### License
This project is licensed under the MIT License - see the LICENSE.md file for details.
