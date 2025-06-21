# Edson Limeme – Serverless Resume Website

This project is a fully serverless resume website using:

- 🖥️ S3 for static hosting
- 🧠 Lambda (Python) for contact form
- 🌐 API Gateway for HTTP trigger
- 🛠️ Terraform for infrastructure
- 🤖 GitHub Actions for CI/CD

## 🔗 Live Links

- Resume Site: http://edson-resume-site-demo.s3-website.af-south-1.amazonaws.com
- Contact API:

## 📝 Contact Handler

Submits form data to a Lambda function that logs it and responds.

---
| Step | Tool                          | Purpose                                 |
| ---- | ----------------------------- | --------------------------------------- |
| 1    | VS Code                       | Write code and manage project files     |
| 2    | Git & GitHub                  | Version control and CI/CD               |
| 3    | Terraform CLI                 | Infrastructure-as-Code for AWS setup    |
| 4    | AWS Account (Console + IAM)   | Where your site lives                   |
| 5    | GitHub Actions                | Automate deployment                     |
| 6    | AWS S3 + Lambda + API Gateway | Hosting website & backend contact logic |

## Deployment Journey and Troubleshooting

During the deployment process, several challenges were encountered and resolved:

1. **Resource Naming and Terraform Configuration Issues**  
   - Initial errors due to referencing undeclared Terraform resources and missing input variables like `aws_region`.  
   - Fixed by properly declaring variables and using correct resource references.

2. **Bucket Policy and Public Access Settings**  
   - AWS S3 blocks public policies by default, which prevented setting bucket policies.  
   - Resolved by disabling the `BlockPublicPolicy` setting via `aws_s3_bucket_public_access_block` resource and applying a bucket policy to allow public read access.

3. **Bucket Already Exists Error**  
   - Terraform plan failed because the bucket `edson-resume-site-demo` already existed and was owned by the user.  
   - Resolved by importing the existing bucket into Terraform state using:  
     ```bash
     terraform import aws_s3_bucket.resume_site edson-resume-site-demo
     ```

4. **Incorrect Website Endpoint URL**  
   - The initially used URL for accessing the website was incorrect, causing DNS errors.  
   - Fixed by using the correct S3 website endpoint format:  
     ```
     http://edson-resume-site-demo.s3-website.af-south-1.amazonaws.com
     ```

---

## Accessing the Website

Your resume website is now live and accessible at: http://edson-resume-site-demo.s3-website.af-south-1.amazonaws.com


---

## Terraform Files Structure

- `main.tf`  
  Defines AWS provider, creates S3 bucket, bucket policy, public access block, website configuration, and uploads static files (`index.html`, `style.css`).

- `variables.tf`  
  Declares input variables such as `aws_region` and `bucket_name`.

- `outputs.tf`  
  Outputs the website URL after deployment.

- `.github/workflows/deploy.yml`  
  GitHub Actions workflow automating Terraform init, plan, and apply on pushes to the `main` branch.

---

## How to Deploy

1. **Set up AWS credentials**  
   - Add your AWS credentials (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`) as secrets in your GitHub repository.

2. **Push code to GitHub**  
   - On push to the `main` branch, GitHub Actions will automatically run Terraform commands to deploy your infrastructure.

3. **Monitor workflow**  
   - Check GitHub Actions tab to monitor deployment progress and logs.

4. **Visit your website**  
   - Use the output URL to view your deployed resume site.

---

## Future Improvements

- Add a custom domain with SSL support using AWS CloudFront and Route 53.
- Add automatic cache invalidation on CloudFront after updates.
- Implement Terraform plan review in CI before apply.
- Automate HTTPS redirection.

---

## Contact

If you encounter any issues or want to contribute, feel free to open an issue or pull request.

---

Thank you for following along this deployment journey!
