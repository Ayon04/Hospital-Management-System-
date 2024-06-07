<?php
session_start();
require '../model/Data.php';

if (!isset($_SESSION['LoggedIn'])) {
    header("Location: UserLogin.php");
    exit();
}

function sanitize($data) {
    $data = htmlspecialchars($data);
    return $data;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $test_ID = sanitize($_POST["update_test_ID"]); // Corrected name to match the form input
    $patient_name = sanitize($_POST["upatient_name"]);
    $patient_age = sanitize($_POST["upatient_age"]);
    $mobile_no = sanitize($_POST["umobile_no"]);
    $doctorRef = sanitize($_POST["udoc_ref"]);
    $diagnosis = sanitize($_POST["udiagnosis"]);
    $delivery_date = sanitize(!empty($_POST['udelivery_date']) ? $_POST['udelivery_date'] : date("Y-m-d"));
    $fee = sanitize($_POST["utest_fee"]);

    $isValid = true;

    if (empty($patient_name) || empty($patient_age) || empty($mobile_no) || empty($doctorRef)|| empty($fee) || empty($diagnosis) || empty($delivery_date)) {
        $_SESSION['update_error'] = "Please fill in all the fields.";
        $isValid = false;
    }

    if (!is_numeric($mobile_no) || strlen($mobile_no) != 11 ) {
        $_SESSION['update_error'] = "Mobile number must be numeric and exactly 11 digits.";
        $isValid = false;
    }

    if (!is_numeric($fee)) {
        $_SESSION['update_error'] = "Test fee must be numeric.";
        $isValid = false;
    }

    if (!is_numeric($patient_age) || strlen($patient_age) > 3) {
        $_SESSION['update_error'] = "Age must be numeric and valid.";
        $isValid = false;
    }

    if ($isValid && isset($_POST['update_bill'])) {
        // Perform the update
        $update_result = update_diagnosis($test_ID, $patient_name, $patient_age, $mobile_no, $doctorRef, $diagnosis, $delivery_date, $fee);

        if ($update_result) {
            $_SESSION['update_error'] = "Data updated successfully.";
        } else {
            $_SESSION['update_error'] = "Failed to update data.";
        }
    } else {
        $_SESSION['update_error'] = "Invalid input detected. Please check your input and try again.";
    }

    header("Location: ../view/updateDiagnosisBill.php");
    exit();
} else {
    header("Location: ../view/updateDiagnosisBill.php");
    exit();
}
?>
