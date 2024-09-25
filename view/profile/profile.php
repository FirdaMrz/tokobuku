<?php
session_start();
require_once('../../model/auth.php'); // Sesuaikan jalur

// Pastikan user sudah login
if (!isset($_SESSION['username'])) {
    header('location: ../../login.php'); // Sesuaikan jalur
    exit;
}

$username = $_SESSION['username'];
$userInfo = $auth->getUserInfo($username);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link href="../../assets/css/bootstrap.css" rel="stylesheet"> <!-- Sesuaikan jalur -->
    <style>
        .profile-container {
            margin-top: 20px;
        }
        .profile-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .profile-info {
            flex: 1;
            padding-right: 20px;
        }
        .profile-info th, .profile-info td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .profile-image {
            flex: 0 0 150px;
            text-align: center;
        }
        .profile-image img {
            width: 100%;
            border-radius: 50%;
        }
        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container profile-container">
        <h2>PROFILE</h2>
        <?php if ($userInfo): ?>
            <div class="profile-row">
                <div class="profile-info">
                    <table class="table">
                        <tbody>
                            <tr>
                                <th>Username:</th>
                                <td><?php echo htmlspecialchars($userInfo['username']); ?></td>
                            </tr>
                            <tr>
                                <th>Full Name:</th>
                                <td><?php echo isset($userInfo['fullname']) ? htmlspecialchars($userInfo['fullname']) : 'N/A'; ?></td>
                            </tr>
                            <tr>
                                <th>Email:</th>
                                <td><?php echo isset($userInfo['email']) ? htmlspecialchars($userInfo['email']) : 'N/A'; ?></td>
                            </tr>
                            <tr>
                                <th>Akses Level:</th>
                                <td><?php echo htmlspecialchars($userInfo['akses']); ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="profile-image">
                  <img src="../../assets/img/profile.jpeg" alt="Profile Picture">
                </div>

            </div>
            <a href="javascript:history.back()" class="btn btn-primary btn-back">Kembali</a>
        <?php else: ?>
            <p>User not found.</p>
        <?php endif; ?>
    </div>
</body>
</html>
