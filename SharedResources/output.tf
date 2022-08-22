output "cognito_arn_dev"{
    value = aws_cognito_user_pool.image_clustering_user_pool_dev.arn
}

output "user_pool_id" {
  description = "name of the user pool"
  value       = aws_cognito_user_pool.image_clustering_user_pool_dev.id
}


output "client_id" {
  description = "The ids of the user pool clients"
  value       = aws_cognito_user_pool_client.client.id 
}

output "client_secret" {
  description = " The client secrets of the user pool clients"
  value       = aws_cognito_user_pool_client.client.client_secret
  sensitive   = true
}

output "cognito_scope_identifiers"{
  description = "Scope identifier for API Gateways"
  value     = aws_cognito_resource_server.resource_server.scope_identifiers
}
