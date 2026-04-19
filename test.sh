#!/bin/bash
echo "=============================="
echo " Running Tests..."
echo "=============================="

# Test 1: Run the app
./app.sh
if [ $? -eq 0 ]; then
  echo "TEST 1 PASSED: app.sh ran successfully"
else
  echo "TEST 1 FAILED: app.sh returned error"
  exit 1
fi

# Test 2: Check app.sh exists and is executable
if [ -x "./app.sh" ]; then
  echo "TEST 2 PASSED: app.sh is executable"
else
  echo "TEST 2 FAILED: app.sh not executable"
  eit 1
fi

echo "=============================="
echo " All tests passed!"
echo "=============================="
exit0
