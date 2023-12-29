# Use the API

- `curl -X POST -H "Content-Type: application/json" -d '{"email": "user@example.com"}' http://localhost:8000/api/login-with-otp/` Request OTP for login
- `curl -X POST -H "Content-Type: application/json" -d '{"email": "user@example.com", "otp": "123456"}' http://localhost:8000/api/validate-otp/` validate OTP and authenticate user

---

- `curl -X POST -H "Content-Type: application/json" -d '{"phone_number": "+1234567890"}' http://localhost:8000/api/login-with-otp/` Request phone otp for login
