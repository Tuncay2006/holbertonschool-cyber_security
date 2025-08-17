# Holberton School Domain Reconnaissance Report

## Domain Overview

- **Domain:** holbertonschool.com
- **Purpose:** Educational platform for software engineering.
- **Scope:** All subdomains and IP ranges.
## IP Ranges

| IP Range | Description |
|----------|-------------|
| 75.2.70.0/24 | AWS Hosted Services |
| 99.83.190.0/24 | AWS Hosted Services |
| 52.85.96.0/24 | AWS Hosted Services |
## Subdomains and Technologies

| Subdomain | Technologies / Frameworks |
|-----------|---------------------------|
| www.holbertonschool.com | Nginx, PHP, WordPress, Cloudflare |
| blog.holbertonschool.com | WordPress, Jetpack |
| assets.holbertonschool.com | AWS S3, CDN, JavaScript frameworks |
| apply.holbertonschool.com | Ruby on Rails, PostgreSQL, Nginx |
## Observations and Notes

1. Holberton School uses multiple cloud providers (AWS).  
2. Some subdomains use CDNs like Cloudflare or Akamai.  
3. Web apps rely on frameworks like Ruby on Rails, WordPress, Webflow.  
4. Support subdomains may use third-party services (Zendesk).  
5. IP ranges indicate distributed hosting across regions.

## Conclusion

The Shodan scan shows diverse infrastructure with multiple subdomains, cloud hosting, and varied technologies.
