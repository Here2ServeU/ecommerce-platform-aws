import json
import boto3
import os
import jwt
from decimal import Decimal

dynamodb = boto3.resource('dynamodb')
table_name = os.getenv('DYNAMODB_TABLE')
table = dynamodb.Table(table_name)

def lambda_handler(event, context):
    path = event['rawPath']
    if path == "/checkout":
        return handle_checkout(event)
    else:
        return {
            'statusCode': 404,
            'body': json.dumps({'message': 'Not Found'})
        }

def handle_checkout(event):
    try:
        body = json.loads(event['body'])
        cart = body['cart']
        total_price = sum(item['price'] for item in cart)

        # Save order to DynamoDB
        order = {
            'id': str(uuid.uuid4()),
            'cart': cart,
            'total_price': Decimal(str(total_price)),
            'status': 'Pending'
        }
        table.put_item(Item=order)

        # Response
        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Order processed successfully!', 'order_id': order['id']})
        }
    except Exception as e:
        print(e)
        return {
            'statusCode': 500,
            'body': json.dumps({'message': 'Error processing order'})
        }

def lambda_handler(event, context):
    token = event['headers']['Authorization']
    decoded_token = jwt.decode(token, options={"verify_signature": False})
    user_email = decoded_token.get("email")
    return {
        "statusCode": 200,
        "body": f"Welcome, {user_email}!"
    }

# Placeholder Lambda function
