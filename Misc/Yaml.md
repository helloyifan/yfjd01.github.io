```

# (Comment) YAML Ain't Markup Language,

# indentation is scope

person:
  name: &name "Jonathan" # Anchor a value
  occupation: 'programmer' # single and double quote both string same as json
  age: 23
  float_age: !!float 23 # 23.0
  gpa: 3.5
  string_gpa: !!str 3.5 # "3.5"
  fav_num: 1e+10 # scientific notaion supported
  male: true
  birthday: 1994-02-06 14:33:22 # ISO 6801 or something standard
  flaws: null
  hobbies: # lists
    - hiking
    - movies
    - riding bike
  movies: ['Dark Knight', "Avengers"] # also list
  friends: #list of items and possible ways
    - name: "Steph"
      age: 22
    - {name: "Adam", age: 22}
    -
      name: "joe"
      age: 23 #all 3 are the same thing, all valid

  description: > #This > will render all this text to be a single line with spaces instead of new line
    Text Text Text Text Text Text
    Text Text Text Text Text Text
    Text Text Text Text Text Text
  signature:
    Jonathan
    Amazon
    email - stuff@place.com
  id: *name #using the name anchor set above so this is Jonathan

  base: &base # anchoring a key value pair
    var: value1

  foo:
    <<: *base # this will be rendered as var1: value1
    var2: value2
```