
#Remove tabs with spaces as python don't recognize tabs
#04/16
"""
Python Collections (Arrays)
There are four collection data types in the Python programming language:

List is a collection which is ordered and changeable. Allows duplicate members.
Tuple is a collection which is ordered and unchangeable. Allows duplicate members.
Set is a collection which is unordered and unindexed. No duplicate members.
Dictionary is a collection which is ordered* and changeable. No duplicate members.
"""

#list : ordered, changeble, allow duplicates, allow different data types

		#lists
			thislist = [100, 50, 65, 82, 23]
			thislist.sort()
			print(thislist)

		#sorting descending order :

			thislist = [100, 50, 65, 82, 23]
			thislist.sort(reverse = True)
			print(thislist)

		#You can also customize your own function by using the keyword argument key = function.

		#The function will return a number that will be used to sort the list (the lowest number first):

			def myfunc(n):
			  return abs(n - 50)

			thislist = [100, 50, 65, 82, 23]
			thislist.sort(key = myfunc)
			print(thislist)
		#Output : [50, 65, 23, 82, 100]

		#Sort is case insensitive (resulting in all capital letters being sorted before lower case letters)

			thislist = ["banana", "Orange", "Kiwi", "cherry"]
			thislist.sort()
			print(thislist)

		#output : ['Kiwi', 'Orange', 'banana', 'cherry']


		#making case sensitive 
			thislist.sort(key = str.lower)
		#output : ['banana', 'cherry', 'Kiwi', 'Orange']

		#Reverse Order
			thislist = ["banana", "Orange", "Kiwi", "cherry"]
			thislist.reverse()
			print(thislist)

		#output: ['cherry', 'Kiwi', 'Orange', 'banana']


		#Copy list
		#You cannot copy a list simply by typing list2 = list1

			thislist = ["apple", "banana", "cherry"]
			mylist = thislist.copy()

			#or
			thislist = ["apple", "banana", "cherry"]
			mylist = list(thislist)



		#Join Two Lists
			list1 = ["a", "b", "c"]
			list2 = [1, 2, 3]

			list3 = list1 + list2

			#or
			for x in list2:
			  list1.append(x)

			#or 
			list1.extend(list2)


		#count values in list
			fruits = ["apple", "banana", "cherry"]

			x = fruits.count("cherry")

#tuple : ordered, unchangeble, allow duplicates, allow different data types

			thistuple = ("apple", "banana", "cherry")
			print(thistuple)
		#len
			thistuple = ("apple", "banana", "cherry")
			print(len(thistuple))

		#To create a tuple with only one item, you have to add a comma after the item, 
			thistuple = ("apple",)          #',' is required 
			print(type(thistuple))
		#The tuple() Constructor
			thistuple = tuple(("apple", "banana", "cherry")) # note the double round-brackets

		#Access Tuple Items
			thistuple[1]
			thistuple[2:5] #The search will start at index 2 (included) and end at index 5 (not included).
		#Check if Item Exists
		    "apple" in thistuple:

		 #Change Tuple Values
		 #But there is a workaround. You can convert the tuple into a list, change the list, and convert the list back into a tuple.

			x = ("apple", "banana", "cherry")
			y = list(x)
			y[1] = "kiwi"
			x = tuple(y)
		#Add Items - we cann't add items 
		# convert list and then can add
			thistuple = ("apple", "banana", "cherry")
			y = list(thistuple)
			y.append("orange")
			thistuple = tuple(y)
		#unpacking
			fruits = ("apple", "banana", "cherry")

			(green, yellow, red) = fruits
			#Using Asterisk*
			fruits = ("apple", "banana", "cherry", "strawberry", "raspberry")

			(green, yellow, *red) = fruits
#sets : Un ordered, un changeable , not allow duplicates, can contain different data types
			#Access sets
				thisset = {"apple", "banana", "cherry"}
				for x in thisset:
 				print(x)

			#The set() Constructor
				thisset = set(("apple", "banana", "cherry")) # note the double round-brackets
			#Add Items
				thisset.add("orange")  #Once a set is created, you cannot change its items, but you can add new items.
			#Add Sets
				thisset = {"apple", "banana", "cherry"}
				tropical = {"pineapple", "mango", "papaya"}

				thisset.update(tropical)
			#Add Any Iterable
				thisset = {"apple", "banana", "cherry"}
				mylist = ["kiwi", "orange"]

				thisset.update(mylist)
			#Remove Item
				thisset.remove("banana")  #If the item to remove does not exist, remove() will raise an error.
			#discard
				thisset.discard("banana") #If the item to remove does not exist, discard() will NOT raise an error.
			#pop : removes last item
				x = thisset.pop() #Remember that sets are unordered, so you will not know what item that gets removed.

			#Join Two Sets  
				set1 = {"a", "b" , "c"}
				set2 = {1, 2, 3}

				set3 = set1.union(set2) #Both union() and update() will exclude any duplicate items.
				set1.update(set2) 
			#Keep ONLY the Duplicates
				#method will keep only the items that are present in both sets
				x = {"apple", "banana", "cherry"}
				y = {"google", "microsoft", "apple"}

				x.intersection_update(y)
				z = x.intersection(y)
			#method will keep only the elements that are NOT present in both sets.
				x = {"apple", "banana", "cherry"}
				y = {"google", "microsoft", "apple"}

				x.symmetric_difference_update(y)
#Dictionaries : ordered(3.7), changeable, not allow duplicates
			#access
				x = thisdict["model"]
				x = thisdict.get("model")

			#Duplicate values will overwrite existing values:
				thisdict = {
							  "brand": "Ford",
							  "model": "Mustang",
							  "year": 1964,
							  "year": 2020
							}
							print(thisdict)
			#Change Values
				thisdict = {
							  "brand": "Ford",
							  "model": "Mustang",
							  "year": 1964
							}
							thisdict["year"] = 2018
			#Removing Items
				#The pop() method removes the item with the specified key name:

				thisdict.pop("model")
			#loop
				for x in thisdict.values():  #values
  					print(x)
  				for x in thisdict.keys():   #keys
  					print(x)
  				for x, y in thisdict.items():
  					print(x, y)
#Short Hand If else
				if a > b: print("a is greater than b")
			#Short Hand If ... Else
				a = 2
				b = 330
				print("A") if a > b else print("B")
#while loop
				#continue -by passes the execution of block, #break - breaks the iterations.
				i = 1
				while i < 6:
				  print(i)
				  i += 1
			  #The else Statement
			  #With the else statement we can run a block of code once when the condition no longer is true:
					i = 1
					while i < 6:
					  print(i)
					  i += 1
					else:
					  print("i is no longer less than 6")
#for 	
				fruits = ["apple", "banana", "cherry"]
				for x in fruits:
				  print(x)
			#break 
				fruits = ["apple", "banana", "cherry"]
				for x in fruits:
				  if x == "banana":
				    break
				  print(x)
			#continue
				fruits = ["apple", "banana", "cherry"]
				for x in fruits:
				  if x == "banana":
				    continue
				  print(x)
			#range
				for x in range(6):	#Note that range(6) is not the values of 0 to 6, but the values 0 to 5.
  					print(x)
  				for x in range(2, 30, 3):
  					print(x)
  			#Else in For Loop
  				for x in range(6):
				  print(x)
				else:
				  print("Finally finished!")  #The else block will NOT be executed if the loop is stopped by a break statement.
			#Nested Loops
				adj = ["red", "big", "tasty"]
				fruits = ["apple", "banana", "cherry"]

				for x in adj:
				  for y in fruits:
				    print(x, y)

#functions 	
				def my_function():
					print("Hello from a function")
  			#Calling a Function
  				def my_function():
					print("Hello from a function")

				my_function()
			#Arbitrary Arguments, *args
				def my_function(*kids):
  					print("The youngest child is " + kids[2])

				my_function("Emil", "Tobias", "Linus")
			#key = value syntax.
				def my_function(child3, child2, child1):
  					print("The youngest child is " + child3)

				my_function(child1 = "Emil", child2 = "Tobias", child3 = "Linus")
			#Arbitrary Keyword Arguments, **kwargs
				def my_function(**kid):
  					print("His last name is " + kid["lname"])

				my_function(fname = "Tobias", lname = "Refsnes") #If you do not know how many keyword arguments that will be passed into your function, add two asterisk: ** before the parameter name in the function definition.
			#Default Parameter Value
				def my_function(country = "Norway"):
  					print("I am from " + country)

				my_function("Sweden")
				my_function("India")
				my_function()
				my_function("Brazil")
			#Passing a List as an Argument
				def my_function(food):
  					for x in food:
    				print(x)

				fruits = ["apple", "banana", "cherry"]

				my_function(fruits)
			#Return Values
				def my_function(x):
  					return 5 * x

				print(my_function(3))
			#The pass Statement #function definitions cannot be empty, but if you for some reason have a function definition with no content, put in the pass statement to avoid getting an error.
				def myfunction():
  					pass
  			#Recursion --for recursions you must return some value other wise it gives an error.
				def tri_recursion(k):
				  if(k > 0):
				    result = k + tri_recursion(k - 1)
				    print(result)
				  else:
				    result = 0
				  return result

				print("\n\nRecursion Example Results")
				tri_recursion(6)


#Python Lambda - anonymous function
#A lambda function can take any number of arguments, but can only have one expression.
#syntax : lambda arguments : expression

			#Add 10 to argument a, and return the result:
				x = lambda a : a + 10
				print(x(5))
			#Multiply argument 
				x = lambda a, b : a * b
				print(x(5, 6))
			#Why Use Lambda Functions
				def myfunc(n):
  					return lambda a : a * n

				mydoubler = myfunc(2)
				mytripler = myfunc(3)

				print(mydoubler(11))
				print(mytripler(11))

#Python Arrays : Python doesn't have arrays.
#how to use LISTS as ARRAYS, however, to work with arrays in Python you will have to import a library, like the NumPy library.

#Python classes : 
#Almost everything in Python is an object, with its properties and methods.
#A Class is like an object constructor, or a "blueprint" for creating objects.
			#Ex Class
				class MyClass:
	  				x = 5

  			#Create Object
  				p1 = MyClass()
				print(p1.x)

			#The __init__() Function
			#All classes have a function called __init__(), which is always executed when the class is being initiated.
			#Use the __init__() function to assign values to object properties, or other operations that are necessary to do when the object is being created:
			#The __init__() function is called automatically every time the class is being used to create a new object.

				class Person:
  					def __init__(self, name, age):
    					self.name = name
    					self.age = age

				p1 = Person("John", 36)

				print(p1.name)
				print(p1.age)

			#Object Methods
				class Person:
  					def __init__(self, name, age):
    					self.name = name
    					self.age = age

  					def myfunc(self):
    					print("Hello my name is " + self.name)

					p1 = Person("John", 36)
					p1.myfunc()
				#Note : The self parameter is a reference to the current instance of the class, and is used to access variables that belong to the class.
				#It does not have to be named self , you can call it whatever you like, but it has to be the first parameter of any function in the class:
			#Modify Object Properties
					p1.age = 40
					del p1.age  #delete object property
					del p1      #delete object

			#The pass Statement - to aviod error for un implemented classes
					class Person:
  						pass
#Python Inheritance
#Inheritance allows us to define a class that inherits all the methods and properties from another class.
#Parent class is the class being inherited from, also called base class.
#Child class is the class that inherits from another class, also called derived class.
			#Create a Parent Class
				class Person:
					def __init__(self, fname, lname):
						self.firstname = fname
						self.lastname = lname

					def printname(self):
						print(self.firstname, self.lastname)

			#Use the Person class to create an object, and then execute the printname method:

				x = Person("John", "Doe")
				x.printname()

			#Create a Child Class
				#Create a class named Student, which will inherit the properties and methods from the Person class:
				#Use the pass keyword when you do not want to add any other properties or methods to the class.
				class Student(Person):
  					pass
  			#access parent class members
  				x = Student("Mike", "Olsen")
				x.printname()
			#Use the super() Function
			#Python also has a super() function that will make the child class inherit all the methods and properties from its parent:
			#Add Properties to child class 
				class Student(Person):
  					def __init__(self, fname, lname, year):
    					super().__init__(fname, lname)
    					self.graduationyear = year
    				def welcome(self):
    					print("Welcome", self.firstname, self.lastname, "to the class of", self.graduationyear)

				x = Student("Mike", "Olsen", 2019)
				print(x.firstname)
				print(x.lastname)
				print(x.graduationyear)
				x.welcome()
#Iterator : will be back again

#Python Scope 
		#local variable
		#A variable created inside a function belongs to the local scope of that function, and can only be used inside that function.

				def myfunc():
  					x = 300
  					print(x)

				myfunc()
				#output 300
		#Function Inside Function - can access local variables in innner class
				def myfunc():
  					x = 300
  				def myinnerfunc():
    				print(x)
  					myinnerfunc()

				myfunc()
				#output 300
		#Global Scope
				#A variable created in the main body of the Python code is a global variable and belongs to the global scope.
				x = 300

				def myfunc():
  					print(x)

				myfunc()

				print(x)
		#Naming Variables
				#Python will treat them as two separate variables, one available in the global scope (outside the function) and one available in the local scope (inside the function)
					x = 300

					def myfunc():
  						x = 200
  						print(x)

					myfunc()

					print(x)
		#Global Keyword
					def myfunc():
  						global x
  						x = 300

					myfunc()

					print(x)
		#To change the value of a global variable inside a function, refer to the variable by using the global keyword:

					x = 300

					def myfunc():
  						global x
  						x = 200

					myfunc()

					print(x)
#Python Modules
		#Consider a module to be the same as a code library.
		#To create a module just save the code you want in a file with the file extension .py:
		#Save this code in a file named mymodule.py
					def greeting(name):
  						print("Hello, " + name)
  		#Use a Module
  			#Import the module named mymodule, and call the greeting function:
  					import mymodule

					mymodule.greeting("Jonathan")
		#The module can contain functions, as already described, but also variables of all types (arrays, dictionaries, objects etc):

					person1 = {
  						"name": "John",
  						"age": 36,
  						"country": "Norway"

						}

	    #accessing dictionary values
	    			import mymodule

						a = mymodule.person1["age"]
						print(a)
		#Naming a Module
				#You can name the module file whatever you like, but it must have the file extension .py
		#Re-naming a Module
				#You can create an alias when you import a module, by using the as keyword:

					import mymodule as mx

						a = mx.person1["age"]
						print(a)

		#Built-in Modules
					import platform

						x = platform.system()
						print(x)
		#Using the dir() Function
				#There is a built-in function to list all the function names (or variable names) in a module. The dir() function:
					import platform

						x = dir(platform)
						print(x)
       	#Import From Module
       			#The module named mymodule has one function and one dictionary:
       					def greeting(name):
  							print("Hello, " + name)

						person1 = {
								"name": "John",
								"age": 36,
								"country": "Norway"
							}	
				#accessing memembers with from
					from mymodule import person1

					print (person1["age"])	
				#Note: When importing using the from keyword, do not use the module name when referring to elements in the module. Example: person1["age"], not mymodule.person1["age"]		
#Python Datetime
	#A date in Python is not a data type of its own, but we can import a module named datetime to work with dates as date objects.

					import datetime

					x = datetime.datetime.now()
					print(x)
					#o/p : 2021-04-17 01:54:56.553417

					import datetime

					x = datetime.datetime.now()

					print(x.year)
					print(x.strftime("%A"))

					#o/p: 2021
					#	  Saturday
					#Creating Date Objects
						#To create a date, we can use the datetime() class (constructor) of the datetime module.

						#The datetime() class requires three parameters to create a date: year, month, day.	and it takes time values but not mandatory.
						import datetime

						x = datetime.datetime(2020, 5, 17)

						print(x)
					#The strftime() Method, below code returns month fulll name.
						import datetime

						x = datetime.datetime(2018, 6, 1)

						print(x.strftime("%B"))

#Math module : import math - > to access various members to perform operations like min(), max(), sqrt()
						x = min(5, 10, 25)
						y = max(5, 10, 25)

						print(x)
						print(y)
#Json :
						import json

						import json

						# some JSON:
						x =  '{ "name":"John", "age":30, "city":"New York"}'

						# parse x:
						y = json.loads(x)

						# the result is a Python dictionary:
						print(y["age"])

						#Convert from Python to JSON
						import json

						# a Python object (dict):
						x = {
						  "name": "John",
						  "age": 30,
						  "city": "New York"
						}

						# convert into JSON:
						y = json.dumps(x)

						# the result is a JSON string:
						print(y)
#Reg-ex : A RegEx, or Regular Expression, is a sequence of characters that forms a search pattern.

						import re
						txt = "The rain in Spain"
                        x = re.search("^The.*Spain$", txt)  #Search the string to see if it starts with "The" and ends with "Spain":
                        x = re.findall("ai", txt)   #function returns a list containing all matches.
                        x = re.search("\s", txt)    #Search for the first white-space character in the string:
                        x = re.split("\s", txt)     #function returns a list where the string has been split at each match:
                        x = re.split("\s", txt, 1)  #Split the string only at the first occurrence:
                        x = re.sub("\s", "9", txt)	#Replace every white-space character with the number 9:
                        x = re.search(r"\bS\w+", txt) #Search for an upper case "S" character in the beginning of a word, and print its position:
           #.span() returns a tuple containing the start-, and end positions of the match.
		   #.string returns the string passed into the function
           #.group() returns the part of the string where there was a match
#PIP : PIP is a package manager for Python packages, or modules if you like.

#Try except 
						try:
  							print(x)
						except:
  							print("An exception occurred")


  						try:
  							print(x)
						except NameError:
  							print("Variable x is not defined")
						except:
  							print("Something else went wrong")

  						#The try block does not raise any errors, so the else block is executed:

						try:
  							print("Hello")
						except:
  							print("Something went wrong")
						else:
  							print("Nothing went wrong")

  						#The finally block gets executed no matter if the try block raises any errors or not:

						try:
  							print(x)
						except:
  							print("Something went wrong")
						finally:
  							print("The 'try except' is finished")
#Raise an exception :As a Python developer you can choose to throw an exception if a condition occurs.
						x = -1

						if x < 0:
  						raise Exception("Sorry, no numbers below zero")

  						x = "hello"

						if not type(x) is int:
  						raise TypeError("Only integers are allowed")
#User Input :input()
						username = input("Enter username:")
						print("Username is: " + username)
#String format() 		
						price = 49
						txt = "The price is {} dollars"
						print(txt.format(price))

						txt = "The price is {:.2f} dollars" #Format the price to be displayed as a number with two decimals:

						#multiple values
						quantity = 3
						itemno = 567
						price = 49
						myorder = "I want {} pieces of item number {} for {:.2f} dollars."
						print(myorder.format(quantity, itemno, price))
						#index
						age = 36
						name = "John"
						txt = "His name is {1}. {1} is {0} years old."
						print(txt.format(age, name))

						#Named Indexes
						myorder = "I have a {carname}, it is a {model}."
						print(myorder.format(carname = "Ford", model = "Mustang"))

