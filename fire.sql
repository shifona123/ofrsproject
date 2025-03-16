CREATE TABLE reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    incident_type ENUM('Building Fire', 'Forest Fire', 'Vehicle Fire', 'Other') NOT NULL,
    description TEXT NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO admins (username, password) VALUES ('andrew', 'andrew2008');

CREATE TABLE fire_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    report_title VARCHAR(255) NOT NULL,
    status ENUM('New', 'Assigned', 'On The Way', 'Completed', 'In Progress') NOT NULL DEFAULT 'New',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fire_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL,
    leader_name VARCHAR(255) NOT NULL,
    leader_contact VARCHAR(20) NOT NULL,
    team_members TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fire_alerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(15) NOT NULL,
    location TEXT NOT NULL,
    message TEXT NOT NULL,
    reporting_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fire_control_teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(255) NOT NULL,
    contact_number VARCHAR(15) NOT NULL,
    status ENUM('Available', 'Busy') DEFAULT 'Available'
);

CREATE TABLE IF NOT EXISTS assigned_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fire_alert_id INT NOT NULL,
    team_id INT NOT NULL,
    assigned_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (fire_alert_id) REFERENCES fire_alerts(id) ON DELETE CASCADE,
    FOREIGN KEY (team_id) REFERENCES fire_control_teams(id) ON DELETE CASCADE
);

CREATE TABLE website_settings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    logo VARCHAR(255) NOT NULL
);
INSERT INTO website_settings (id, title, logo) VALUES (1, 'OFRS', 'uploads/default_logo.png');

