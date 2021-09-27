import sys

home_monitor = open("Answer.txt", "r")
curr_monitor = open("output.txt","r")
home_edid = home_monitor.read().replace('\n',' ')
curr_edid = curr_monitor.read().replace('\n',' ')

#print(home_edid)
print('\n\n\n')
#print(curr_edid)
print(len(home_edid))

result = 5

if(home_edid[0:3086] == curr_edid[0:3086]):
    result = 4
else:
    result = 3

curr_monitor.close()
home_monitor.close()
sys.exit(result)
