# 유저 테이블
CREATE TABLE users
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    username   VARCHAR(255)                   NOT NULL UNIQUE,
    email      VARCHAR(255)                   NOT NULL UNIQUE,
    password   VARCHAR(255)                   NOT NULL,
    role       ENUM ('USER', 'ADMIN', 'HOST') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# 호스트 테이블
CREATE TABLE hosts
(
    id              BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id         BIGINT UNIQUE NOT NULL,
    business_number VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

# 호스트 공간
# 호스트의 공간 안에 여러 호수가 존재할 수 있으므로
CREATE TABLE spaces
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description TEXT,
    address     VARCHAR(255) NOT NULL,
    -- 기타 숙소 관련 정보 (사진, 편의시설 등)
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# 호스트가 등록한 공간들 정보를 묶은 테이블
CREATE TABLE hosts_spaces_relationship
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    host_id    BIGINT NOT NULL,
    space_id   BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES hosts (id),
    FOREIGN KEY (space_id) REFERENCES spaces (id),
    UNIQUE KEY unique_host_space (host_id, space_id),
    INDEX idx_host_id (host_id),
    INDEX idx_space_id (space_id)
);

# 호스트.공간.객실 정보 테이블
CREATE TABLE rooms
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    space_id    BIGINT,
    options_id  BIGINT,
    # 필수 입력 요소
    title       VARCHAR(255)   NOT NULL,
    subtitle    VARCHAR(500)   NOT NULL,
    description VARCHAR(2000)  NOT NULL,
    price       DECIMAL(10, 2) NOT NULL,
    capacity    BIGINT         NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (space_id) REFERENCES spaces (id)
);

# 공간이 가질 수 있는 옵션의 선택지 리스트 테이블
CREATE TABLE options_list
(
    id          BIGINT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    description TEXT
);

# 각 공간이 가지게 되는 옵션들 테이블
CREATE TABLE room_options
(
    id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_id   BIGINT NOT NULL,
    option_id BIGINT NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms (id) ON DELETE CASCADE,
    FOREIGN KEY (option_id) REFERENCES options_list (id) ON DELETE CASCADE,
    UNIQUE KEY (room_id, option_id)
);
/*
INSERT INTO option_list (name, description) VALUES
('TV/프로젝터', 'TV 또는 프로젝터 제공'),
('인터넷/WIFI', '고속 인터넷 및 WiFi 제공'),
('복사/인쇄기', '복사 및 인쇄기 제공');
이런 식으로 옵션 리스트를 넣고,

INSERT INTO room_options (room_id, option_id) VALUES
(1, 1), -- room_id가 1인 객실에 TV/프로젝터 제공
(1, 2); -- room_id가 1인 객실에 인터넷/WIFI 제공
위와 같이 해당 공간에 해당하는 옵션들을 넣는다.
*/

# 예약 테이블
CREATE TABLE reservations
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id    BIGINT                          NOT NULL,
    room_id    BIGINT                          NOT NULL,
    start_date DATE                            NOT NULL,
    end_date   DATE                            NOT NULL,
    status     ENUM ('CONFIRMED', 'CANCELLED') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (room_id) REFERENCES rooms (id)
);

# 객실 사용여부 테이블
CREATE TABLE room_availability
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_id      BIGINT  NOT NULL,
    date         DATE    NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_at   TIMESTAMP        DEFAULT CURRENT_TIMESTAMP,
    updated_at   TIMESTAMP        DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (room_id) REFERENCES rooms (id)
);

# 결제 수단 테이블
CREATE TABLE payment_methods
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

# 결제 테이블
CREATE TABLE payments
(
    id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    reservation_id    BIGINT                                              NOT NULL,
    payment_method_id BIGINT                                              NOT NULL,
    amount            DECIMAL(10, 2)                                      NOT NULL,
    status            ENUM ('PENDING', 'COMPLETED', 'FAILED', 'REFUNDED') NOT NULL,
    transaction_id    VARCHAR(255),
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES reservations (id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_methods (id)
);
