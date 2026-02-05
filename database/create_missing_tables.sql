USE ilioom_dashboard;

CREATE TABLE `ad_monthly_goals` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `year_month` VARCHAR(7) NOT NULL,
    `budget` DECIMAL(12,2),
    `target_roas` DECIMAL(5,2),
    `target_revenue` DECIMAL(12,2),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`) ON DELETE CASCADE,
    UNIQUE KEY `uk_user_month` (`user_id`, `year_month`),
    INDEX `idx_year_month` (`year_month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ad_accumulated_data` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` VARCHAR(20) NOT NULL,
    `date` DATE NOT NULL,
    `campaign_name` VARCHAR(255) NOT NULL,
    `spend` DECIMAL(12,2) NOT NULL DEFAULT 0,
    `impressions` INT DEFAULT 0,
    `clicks` INT DEFAULT 0,
    `conversions` INT DEFAULT 0,
    `revenue` DECIMAL(12,2) DEFAULT 0,
    `ad_type` VARCHAR(20) DEFAULT 'general',
    `uploaded_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY `uk_user_date_campaign` (`user_id`, `date`, `campaign_name`, `ad_type`),
    INDEX `idx_user_date` (`user_id`, `date`),
    INDEX `idx_date_range` (`user_id`, `date`, `ad_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
