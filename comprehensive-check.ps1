# Comprehensive System Check Script
Write-Host "🔍 Starting Comprehensive System Check..." -ForegroundColor Cyan
Write-Host "=" * 60

$baseUrl = "http://localhost:8081/api"
$frontendUrl = "http://localhost:3000"
$issues = @()
$passed = 0
$failed = 0

function Test-Endpoint {
    param($name, $url, $method = "GET", $body = $null, $headers = @{})
    
    try {
        Write-Host "`n🧪 Testing: $name" -ForegroundColor Yellow
        
        $params = @{
            Uri = $url
            Method = $method
            ContentType = "application/json"
            ErrorAction = "Stop"
        }
        
        if ($headers.Count -gt 0) {
            $params.Headers = $headers
        }
        
        if ($body) {
            $params.Body = $body
        }
        
        $response = Invoke-WebRequest @params
        Write-Host "✅ PASSED: $name (Status: $($response.StatusCode))" -ForegroundColor Green
        $script:passed++
        return $true
    }
    catch {
        Write-Host "❌ FAILED: $name" -ForegroundColor Red
        Write-Host "   Error: $($_.Exception.Message)" -ForegroundColor Red
        $script:failed++
        $script:issues += $name
        return $false
    }
}

# Test 1: Backend Health
Write-Host "`n📡 BACKEND HEALTH CHECKS" -ForegroundColor Magenta
Test-Endpoint "Backend Running" "$baseUrl/../setup/status" "GET"

# Test 2: Authentication
Write-Host "`n🔐 AUTHENTICATION TESTS" -ForegroundColor Magenta
$loginBody = @{username='admin';password='admin123'} | ConvertTo-Json
$loginResult = Test-Endpoint "Admin Login" "$baseUrl/auth/login" "POST" $loginBody

if ($loginResult) {
    $loginResponse = Invoke-WebRequest -Uri "$baseUrl/auth/login" -Method POST -Body $loginBody -ContentType "application/json"
    $loginData = $loginResponse.Content | ConvertFrom-Json
    $token = $loginData.token
    $headers = @{Authorization="Bearer $token"}
    
    # Test 3: Admin Endpoints
    Write-Host "`n👑 ADMIN ENDPOINT TESTS" -ForegroundColor Magenta
    Test-Endpoint "Admin Dashboard" "$baseUrl/admin/dashboard" "GET" $null $headers
    Test-Endpoint "Get All Users" "$baseUrl/admin/users" "GET" $null $headers
    Test-Endpoint "Get Analytics" "$baseUrl/admin/analytics" "GET" $null $headers
}

# Test Instructor Login
$instructorBody = @{username='instructor';password='instructor123'} | ConvertTo-Json
$instructorResult = Test-Endpoint "Instructor Login" "$baseUrl/auth/login" "POST" $instructorBody

if ($instructorResult) {
    $instructorResponse = Invoke-WebRequest -Uri "$baseUrl/auth/login" -Method POST -Body $instructorBody -ContentType "application/json"
    $instructorData = $instructorResponse.Content | ConvertFrom-Json
    $instructorToken = $instructorData.token
    $instructorHeaders = @{Authorization="Bearer $instructorToken"}
    
    # Test 4: Instructor Endpoints
    Write-Host "`n👨‍🏫 INSTRUCTOR ENDPOINT TESTS" -ForegroundColor Magenta
    Test-Endpoint "Instructor Dashboard" "$baseUrl/instructor/dashboard" "GET" $null $instructorHeaders
    Test-Endpoint "Instructor Courses" "$baseUrl/instructor/courses" "GET" $null $instructorHeaders
    Test-Endpoint "Instructor Stats" "$baseUrl/instructor/stats" "GET" $null $instructorHeaders
}

# Test Student Login
$studentBody = @{username='student';password='student123'} | ConvertTo-Json
$studentResult = Test-Endpoint "Student Login" "$baseUrl/auth/login" "POST" $studentBody

if ($studentResult) {
    $studentResponse = Invoke-WebRequest -Uri "$baseUrl/auth/login" -Method POST -Body $studentBody -ContentType "application/json"
    $studentData = $studentResponse.Content | ConvertFrom-Json
    $studentToken = $studentData.token
    $studentHeaders = @{Authorization="Bearer $studentToken"}
    
    # Test 5: Student Endpoints
    Write-Host "`n🎓 STUDENT ENDPOINT TESTS" -ForegroundColor Magenta
    Test-Endpoint "Student Dashboard" "$baseUrl/student/dashboard" "GET" $null $studentHeaders
    Test-Endpoint "Student Courses" "$baseUrl/student/courses" "GET" $null $studentHeaders
}

# Test 6: Public Endpoints
Write-Host "`n🌐 PUBLIC ENDPOINT TESTS" -ForegroundColor Magenta
Test-Endpoint "Public Courses" "$baseUrl/courses/public" "GET"
Test-Endpoint "AI Test Endpoint" "$baseUrl/ai/test" "GET"

# Test 7: Frontend
Write-Host "`n🎨 FRONTEND TESTS" -ForegroundColor Magenta
Test-Endpoint "Frontend Home" $frontendUrl "GET"

# Summary
Write-Host "`n" + ("=" * 60) -ForegroundColor Cyan
Write-Host "📊 TEST SUMMARY" -ForegroundColor Cyan
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "✅ Passed: $passed" -ForegroundColor Green
Write-Host "❌ Failed: $failed" -ForegroundColor Red

if ($issues.Count -gt 0) {
    Write-Host "`n⚠️  ISSUES FOUND:" -ForegroundColor Yellow
    $issues | ForEach-Object { Write-Host "   - $_" -ForegroundColor Yellow }
} else {
    Write-Host "`n🎉 ALL TESTS PASSED! System is working correctly." -ForegroundColor Green
}

Write-Host "`n" + ("=" * 60) -ForegroundColor Cyan

