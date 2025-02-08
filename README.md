# 🚀 My Tailwind React Project

![S3](https://img.shields.io/badge/Hosted%20On-AWS%20S3-orange?style=for-the-badge&logo=amazon)
![Terraform](https://img.shields.io/badge/IaC-Terraform-blueviolet?style=for-the-badge&logo=terraform)

## 🌐 Live URL

🔗 **Website:** [Click Here](http://nike-test-website.s3-website.ap-south-1.amazonaws.com/)

## 📜 Description

This is a **dummy Tailwind CSS project** deployed on **AWS S3** using **Terraform**. It serves as a **learning project** for setting up and hosting React applications with infrastructure-as-code.

## 📂 Project Structure

- **React + Tailwind CSS** for UI
- **Terraform** for Infrastructure
- **AWS S3** for Hosting

## ⚡ Quick Setup

1. **Initialize Terraform:**

   ```sh
   terraform init
   ```

2. **Deploy Infrastructure:**

   ```sh
   terraform apply -auto-approve
   ```

3. **Upload React Build to S3:**

   ```sh
   aws s3 sync ./build s3://your-project-name --acl public-read
   ```

4. **Get Website URL:**
   ```sh
   terraform output website_url
   ```

Enjoy your Tailwind learning journey! 🚀
