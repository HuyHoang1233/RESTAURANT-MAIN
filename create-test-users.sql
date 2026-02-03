-- ========================================
-- 🧪 SCRIPT TẠO TEST USER CHO FORGOT PASSWORD
-- ========================================
-- Chạy script này trong SQL Server Management Studio
-- để tạo user test với email có sẵn

USE RestaurantManagementDB;
GO

-- Xóa user test cũ nếu có (để tránh lỗi duplicate)
DELETE FROM Users WHERE email IN ('test@gmail.com', 'admin@restaurant.com', 'user@test.com');
GO

-- Tạo test users
INSERT INTO Users (role_id, username, password_hash, full_name, phone_number, email, is_active)
VALUES 
    -- User 1: Admin
    (1, 'admin', '123456', 'Administrator', '0123456789', 'admin@restaurant.com', 1),
    
    -- User 2: Test User
    (2, 'testuser', '123456', 'Test User', '0987654321', 'test@gmail.com', 1),
    
    -- User 3: Demo User
    (2, 'demouser', '123456', 'Demo User', '0112233445', 'user@test.com', 1);
GO

-- Kiểm tra users đã tạo
SELECT 
    user_id,
    username,
    email,
    phone_number,
    full_name,
    is_active
FROM Users
WHERE email IN ('test@gmail.com', 'admin@restaurant.com', 'user@test.com');
GO

PRINT '✅ Đã tạo 3 test users thành công!';
PRINT '';
PRINT '📋 Danh sách email có thể dùng:';
PRINT '   - admin@restaurant.com';
PRINT '   - test@gmail.com';
PRINT '   - user@test.com';
PRINT '';
PRINT '🔑 Tất cả password: 123456';
