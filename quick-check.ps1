# Quick System Check
Write-Host "Starting Quick System Check..." -ForegroundColor Cyan

$baseUrl = "http://localhost:8081/api"
$passed = 0
$failed = 0

function Test-API {
    param($name, $url)
    try {
        $response = Invoke-WebRequest -Uri $url -Method GET -ErrorAction Stop
        Write-Host "[PASS] $name" -ForegroundColor Green
        $script:passed++
    }
    catch {
        Write-Host "[FAIL] $name - $($_.Exception.Message)" -ForegroundColor Red
        $script:failed++
    }
}

# Test Backend
Write-Host "`nTesting Backend..." -ForegroundColor Yellow
Test-API "Backend Status" "$baseUrl/../setup/status"
Test-API "Public Courses" "$baseUrl/courses/public"
Test-API "AI Test" "$baseUrl/ai/test"

# Test Authentication
Write-Host "`nTesting Authentication..." -ForegroundColor Yellow
try {
    $body = '{"username":"admin","password":"admin123"}'
    $response = Invoke-WebRequest -Uri "$baseUrl/auth/login" -Method POST -Body $body -ContentType "application/json"
    Write-Host "[PASS] Admin Login" -ForegroundColor Green
    $passed++
    
    $data = $response.Content | ConvertFrom-Json
    $token = $data.token
    
    # Test with token
    $headers = @{Authorization="Bearer $token"}
    $dashResponse = Invoke-WebRequest -Uri "$baseUrl/admin/dashboard" -Method GET -Headers $headers
    Write-Host "[PASS] Admin Dashboard" -ForegroundColor Green
    $passed++
}
catch {
    Write-Host "[FAIL] Authentication - $($_.Exception.Message)" -ForegroundColor Red
    $failed++
}

# Test Frontend
Write-Host "`nTesting Frontend..." -ForegroundColor Yellow
Test-API "Frontend" "http://localhost:3000"

# Summary
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "SUMMARY: Passed=$passed Failed=$failed" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

if ($failed -eq 0) {
    Write-Host "All tests passed!" -ForegroundColor Green
} else {
    Write-Host "Some tests failed. Check the output above." -ForegroundColor Yellow
}

