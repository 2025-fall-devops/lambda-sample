provider "aws" {
  region = "us-east-1"
}

module "function" {
  source  = "git::https://github.com/2025-fall-devops/devops-book//ch3/tofu/modules/lambda"

  name        = "lambda-sample"      
  src_dir     = "${path.module}/src" 
  runtime     = "nodejs20.x"         
  handler     = "index.handler"      
  memory_size = 128                  
  timeout     = 5                    

  environment_variables = {          
    NODE_ENV = "production"
  }

  create_url = true

}