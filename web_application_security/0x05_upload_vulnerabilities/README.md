Question #0
What is a common risk associated with file uploads?

++Server compromise++
Increased performance
Enhanced UI/UX
++Client-side attacks++
++Data corruption++

Question #1
How can file upload vulnerabilities be exploited?

++Executing malicious scripts++
Reading text files
Improving website SEO
++Launching DDoS attacks++
++Stealing sensitive information++

Question #2
What is a secure practice for managing file uploads?

++Restricting upload size++
Allowing all file types
Ignoring MIME types
Client-side validation only

Question #3
What should be checked to prevent file upload vulnerabilities?

File extension only
++MIME types and file content++
User’s reputation
++Secure transport protocols++
++Upload location permissions++

Question #4
What is a Web Shell?

++Remote access tool++
Website template
Secure shell environment
Type of web hosting service
++Malicious script uploaded via vulnerabilities++

Question #5
Why are Content-Type headers important?

++They define media type of the resource++
They prevent XSS attacks
They increase transfer speed
++They confirm file authenticity++
They dictate character encoding

Question #6
What is a mitigation strategy for file uploads?

Disabling file uploads completely
++Manual file content inspection++
Allowing uploads without authentication
++Implement access controls++
++Enforcing file name length++

Question #7
What are Content-Disposition headers used for?

Specifying media type of resource
++As a direction for file display or download++
For redirecting URLs
Indicating server software version
++Providing file handling instructions to the browser++

Question #8
Which actions should be taken for secure file uploads?

++Server-side validation++
Use of CAPTCHAs with every upload
++Restricting uploaded file types++
++Using getimagesize<> for image verification++
Keeping uploaded files in the web root directory

Question #9
How can MIME type spoofing be countered?

Trusting browser-provided MIME types
++Checking file signatures aka magic numbers++
Sanitizing file names alone
++Validating actual file content against expected MIME type++
Relying on file extensions solely

Question #10
Which types of files are generally safer to accept in uploads?

Executable files .exe
++Image files .jpg, .png after validation++
++Plain text files .txt with content validation++
Script files .php, .js without validation
++Compressed archives .zip with content scanning++

Question #11
What is the consequence of failing to validate the upload directory permissions?

++Overwriting critical files++
Better load balancing
Limited user access to resources
++Unauthorized file retrieval or alteration++
None, it’s unrelated to security

Question #12
What can robust antivirus scanning prevent in file uploads?

System performance issues
Detection of all zero-day exploits immediately
++Uploading of known malware or trojans within files++
Blocking legitimate file formats consistently
++Removal of malicious code embedded in files before execution++

Question #13
When testing for upload vulnerability, what should be considered?


Upload size limitations only
++File content and MIME type validation mechanisms++
++Authentication procedures for uploading users++
The strength of client-side validation scripts
++The configuration of the web server and application code handling uploads++
