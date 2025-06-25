set -e

echo "Testing Service 1..."
curl -s -f http://localhost:8080/service1/ping | grep '"status":"ok"'
curl -s -f http://localhost:8080/service1/hello | grep 'Hello'

echo "Testing Service 2..."
curl -s -f http://localhost:8080/service2/ping | grep '"status":"ok"'
curl -s -f http://localhost:8080/service2/hello | grep 'Hello'

echo "All tests passed!"