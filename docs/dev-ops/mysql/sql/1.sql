-- =========================
-- 1. 创建数据库
-- =========================
SET NAMES utf8mb4;

CREATE DATABASE IF NOT EXISTS CDKeyMall
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci;

USE CDKeyMall;


-- =========================
-- 2. 游戏信息表
-- =========================
CREATE TABLE t_game_info (
                             id BIGINT PRIMARY KEY AUTO_INCREMENT,
                             name VARCHAR(255) NOT NULL,
                             genre VARCHAR(100) NOT NULL,
                             cover VARCHAR(500) NOT NULL,
                             summary VARCHAR(1000) NOT NULL,
                             vali_flag TINYINT NOT NULL,
                             create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO t_game_info (name, genre, cover, summary, vali_flag)
VALUES
    ('Elden Ring', 'RPG', 'https://img.com/elden.jpg', '开放世界魂类游戏', 1),
    ('Cyberpunk 2077', 'RPG', 'https://img.com/cyberpunk.jpg', '未来都市开放世界', 1),
    ('Black Myth Wukong', 'Action', 'https://img.com/wukong.jpg', '国产3A动作游戏', 1);


-- =========================
-- 3. SKU库存表
-- =========================
CREATE TABLE t_sku (
                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                       game_id BIGINT NOT NULL,
                       platform VARCHAR(50) NOT NULL,
                       version VARCHAR(100) NOT NULL,
                       stock INT NOT NULL,
                       original_price DECIMAL(10,2) NOT NULL,
                       create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                       update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                       UNIQUE KEY uk_game_platform_version (game_id, platform, version)
);

INSERT INTO t_sku (game_id, platform, version, stock, original_price)
VALUES
    (1, 'Steam', '标准版', 100, 298.00),
    (1, 'Steam', '豪华版', 50, 398.00),
    (2, 'Epic', '标准版', 200, 199.00),
    (3, 'Steam', '豪华版', 80, 268.00);


-- =========================
-- 4. 折扣表
-- =========================
CREATE TABLE t_discount (
                            id BIGINT PRIMARY KEY AUTO_INCREMENT,
                            game_id BIGINT NOT NULL,
                            discount_type TINYINT NOT NULL,
                            discount_value DECIMAL(10,2) NOT NULL,
                            create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO t_discount (game_id, discount_type, discount_value)
VALUES
    (1, 1, 0.80),   -- 8折
    (2, 0, 50.00),  -- 减50
    (3, 1, 0.90);   -- 9折


-- =========================
-- 5. CDKEY表
-- =========================
CREATE TABLE t_cdkey (
                         id BIGINT PRIMARY KEY AUTO_INCREMENT,
                         game_id BIGINT NOT NULL,
                         cdkey VARCHAR(255) NOT NULL UNIQUE,
                         vali_flag TINYINT NOT NULL,
                         activation_platform VARCHAR(50) NOT NULL,
                         region VARCHAR(100) NOT NULL,
                         create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO t_cdkey (game_id, cdkey, vali_flag, activation_platform, region)
VALUES
    (1, 'ELDEN-AAAA-BBBB-CCCC', 1, 'Steam', 'Global'),
    (1, 'ELDEN-DDDD-EEEE-FFFF', 1, 'Steam', 'Global'),
    (2, 'CYBER-1111-2222-3333', 1, 'Epic', 'US'),
    (3, 'WUKONG-XXXX-YYYY-ZZZZ', 2, 'Steam', 'CN');


-- =========================
-- 6. 游戏标签表
-- =========================
CREATE TABLE t_game_tag (
                            id BIGINT PRIMARY KEY AUTO_INCREMENT,
                            tag VARCHAR(100) NOT NULL,
                            game_id BIGINT NOT NULL,
                            create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO t_game_tag (tag, game_id)
VALUES
    ('开放世界', 1),
    ('高难度', 1),
    ('科幻', 2),
    ('剧情向', 2),
    ('国产', 3),
    ('动作', 3);