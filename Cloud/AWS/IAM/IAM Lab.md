
### Root Account: 
* The email that first signed up with AWS.
* You have access to do everything.

### MFA:
* Multi factor authentication
* For protection
* you can use Google authentication app for MFA which I didn't know you could do

### IAM User Console security Credentials:
* User
* Access key ID (like secret user)
* Secret access key  (like secret password)
* Password

* Anyone who has access to Access Key ID  and Secret Access Key can use that aws account
* however you can't use them to login into console, you need console password


### Sample Administrator Access JSON:
```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*", /* So you can do anything*/
            "Resource": "*"  /* To anything*/
        }
    ]
}
```

### You can set password policy
* Sample things you can set (theres obviously more things to choose): 
  * Enforce minimum password length 6 characters
  * Require at least one uppercase letter from Latin alphabet (A-Z)


### Roles: 
* **TLDR: Roles are a way for onw AWS user to access another aws user**


### What have We learnt?
* **IAM is universal.** It does not apply to regions at this time.
* The **"root account"** is simply the account created when you first setup your AWS account. It has complete Admin access
* New Users have **NO permissions** when first created.
* New Users are assigned `Access Key ID` & `Secret Access Keys` when first created, which is not the same as the password
* **These are not the same as a password.** you cannot use the Access Key ID & Secret Access key to Login in to the console. You can use this to access AWS via the APIs Command Line, however.
* You only get to view these once, If you lose them, you have to regenerate them. So, save them in secure location



* Users can have console access and/or programmatic access
* `User` and `Password` is for Console
*  `Access Key ID` & `Secret Access Keys` is for Programmtic access

### More stuff we learnt
* **Always setup Multifactor Authentication on your root account.**
  * you can use google authenticator app
* You can creat and customise your own password rotation policies.