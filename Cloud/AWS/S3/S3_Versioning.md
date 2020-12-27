## S3 - Versioning

Using **Versioning** With S3;

* Store all versions of an object (including all writes and even if you delete an object)
* Great backup too.
* Once enabled, Versioning cannot be disabled,
* Integrates with Lifecycle rules (covered later)
* Versioning's MFA Delete capability, which uses multi-factor authentication, can be used to provide an additional layer of security



### Details: 
* When you upload another revision, it will not take the permissioning of the previous file
* All versions are kept by defaults, you need to manually configure lifecycle rules.


### Exam Tips:

* Stores all versions of an object (including all writes and even if you delete an object)
    * If you delete an object it still exists in versioning, but you can delete the versioning object aswell (remove from history)
* Great backup tool.
* Once enabled, Versioning cannot be disabled, only suspended.
* Integrates with Lifecycle rules
* Versioning's MFA Delete capacity, which uses multi factor authentication, can be used to provide an additional layer of security