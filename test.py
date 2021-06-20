import datetime
import json

a = "0123456789"
print( a[:3])
print( a[1:3])
print(a[-1])

a[2:3]

a[:]

# define a class
class Apple:
    
    def __init__(self):
        self.name = "Apple"
   
    def write(self):
        print(self.name)
        

# main routine
apple = Apple()
apple.write()

print(datetime.datetime.now())

print("adsadsadsadsadsa".encode());

block = {"name" : "apple", "value": 12}

print(json.dumps(block, sort_keys = True).encode())