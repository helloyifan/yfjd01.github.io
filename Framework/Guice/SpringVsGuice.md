## Guice vs Spring – Dependency Injection


Guice and Spring are two robust frameworks used for dependency injection.

Both frameworks cover all the notions of dependency injection. But each one has its own way of implementing it


## Maven Dependencies

Let's start by adding the Guice and Spring Maven dependencies into our pom.xml file:

```
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.1.4.RELEASE</version>
</dependency>
 
<dependency>
    <groupId>com.google.inject</groupId>
    <artifactId>guice</artifactId>
    <version>4.2.2</version>
</dependency>
```


## Dependency Injection Configuration

Dependency injection is a programming technique that we use to make our classes independent of their dependencies

### Spring Wiring

**Spring declares the dependency injection configuration in a special configurations class.** This class must be annotated by the `@Configuration` annotation. The Spring container uses this class as a source of bean definitions.

**Classes managed by Spring are called Spring beans**

Spring uses the `@Autowired` annotation to **wire the dependencies automatically** `@Autowired` is part of Spring's built-in core annotations. We can use `@Autowired` on member variables, setter methods, and constructors

Spring also supports `@Inject`. `@Inject` is part of the Java CDI (Context and Dependency Injection) that defines a standard for dependency injection.

Let's say that we want to automatically wire a dependency to a member variable. We can simply annotate it with `@Autowired`

```
@Component
public class UserService {
    @Autowired
    private AccountService accountService;
}

@Component
public class AccountServiceImpl implements AccountService{

}
```

Secondly, let's create a configuration class to use as the source of bean while loading our application context:

```
@Configuration
@ComponentScan("com.baeldung.di.spring")
public class SpringMainConfig {
}
```

Note that we've also annotated UserService and AccountServiceImpl with `@Component` to register them as beans. **Its' the `@ComponentScan` annotation that will tell Spring where to search for annotated components** 

Even though we've annotated AccountServiceImpl, Spring can map it to the AccountService since it implements AccountService.

Then, we need to define an application context to access the beans. Let's just note that we'll refer to this context in all of our Springs unit tests:

```
ApplicationContext context = new AnnotationConfigApplicationContext(SpringMainConfig.class);
```

Now at runtime, we can retrieve the AccountService instance from our UserService bean

```
UserService userService = context.getBean(UserService.class);
assertNotNull(userService.getAccountService());
```

### Guice Binding

**Guice manages its dependencies in a special class called a module.** A Guice module has to extend the `AbstractModule` class and override its `configure()` method.

Guice uses binding as the equivalent to wiring in Spring.

Simply put, **bindings allow us to define how dependencies are going to be injected into a class**. Guice bindings are declared in our module's configure() method

**Instead of `@Autowired`, Guice uses the `@Inject` annotation to inject the dependencies.**

Let's create an equivalent Guice example

```
public class GuiceUserService {
    @Inject
    private AccountService accountService;
}
```

Secondly, we'll create the module class which is a source of our binding definitions

```
public class GuiceModule extends AbstractModule {
    @Override
    protected void configure() {
        bind(AccountService.class).to(AccountServiceImpl.class)
    }
}
```

Normally, we expect Guice to instantiate each dependency object from their default constructors if there isn't any binding defined explicitly in the `configure()` method.
**But since interfaces can't be instantiated directly, we need to define bindings** to tell Guice which interface will be paired with which implementation.

Then, we need to define an Injector using GuiceModule to get instances of our classes. Let's just note that all of our Guice tests will use this injector:

```
Injector injector = Guice.createInjector(new GuiceModule());
```

Finally, at runtime we retrieve a GuiceUserService instance with a non-null accountService dependency.

```
GuiceUserService guiceUserService = injector.getInstance(GuiceUserService.class)
assertNotNull(guiceUserService.getAccountService());
```