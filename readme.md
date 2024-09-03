# Apna Canteen

**Apna Canteen** is a simple web application designed to manage user login and registration for accessing a canteen's services. The application provides a role-based login system for students, teachers, and staff, allowing users to securely access the canteen dashboard and other features.

## Features

- **User Authentication**: Role-based login for Students, Teachers, and Staff.
- **Session Management**: Maintains user sessions and redirects authenticated users to the dashboard.
- **Cookie Management**: Automatically fills login fields with stored cookies for convenience.
- **User Registration**: Allows new users to register with their details including role, name, department, email, phone, and address.
- **Responsive Design**: User-friendly interface with form validations.

## Technologies Used

- **Java (JSP)**: Backend logic and session management.
- **HTML/CSS**: Structuring and styling the user interface.
- **JavaScript**: Client-side validations and dynamic behavior.
- **JSP Sessions and Cookies**: Managing user sessions and storing login information.
- **Servlets (checkLogin.jsp & register.jsp)**: Handle form submissions and business logic.
- **Tomcat Server**: Application deployment.

## Project Structure

```plaintext
Apna-Canteen/
│
├── src/
│   ├── main/
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   └── web.xml
│   │   │   ├── index.jsp
│   │   │   ├── checkLogin.jsp
│   │   │   ├── register.jsp
│   │   │   ├── dashboard.jsp
│   │   │   ├── style.css
│   │   │   └── login.js
│   │   └── java/
│   │       └── ... (Java classes if any)
│   └── ...
└── ...
```

## Setup and Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/your-username/apna-canteen.git
    cd apna-canteen
    ```

2. **Configure the Project**:
   - Make sure your project structure follows the standard Maven or Gradle setup if you’re using one.
   - Ensure the `web.xml` is correctly configured in `WEB-INF`.

3. **Run the Application**:
   - Deploy the application on a Tomcat server.
   - Open a web browser and go to `http://localhost:8080/ApnaCanteen`.

4. **Usage**:
   - On the login page, enter your role, college ID, and password.
   - If you are a new user, click "Register" and fill in the required information.

## Contributing

If you'd like to contribute to the project, feel free to fork the repository and submit a pull request. Any contributions, such as bug fixes, feature enhancements, or general improvements, are welcome!

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or feedback, please reach out at:

- **Email**: neha.alam2003@gmail.com
- **Phone**: 9382904122