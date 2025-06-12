
import json

def lambda_handler(event, context):
    try:
        body = json.loads(event.get('body', '{}'))

        name = body.get('name')
        email = body.get('email')
        message = body.get('message')

        if not name or not email or not message:
            return {
                'statusCode': 400,
                'body': json.dumps({'error': 'Missing required fields'})
            }

        # For demo: Log the data (you can integrate with SES, DynamoDB, etc.)
        print(f"Contact form submitted: Name={name}, Email={email}, Message={message}")

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Thank you for contacting us!'})
        }

    except Exception as e:
        print(f"Error: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps({'error': 'Internal Server Error'})
        }
