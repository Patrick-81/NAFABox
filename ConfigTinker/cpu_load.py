import psutil

cpu_percent_cores = psutil.cpu_percent(interval=1, percpu=True)
avg = sum(cpu_percent_cores)/len(cpu_percent_cores)
cpu_percent_total_str = ('%.2f' % avg) + '%'
cpu_percent_cores_str = [('%.2f' % x) + '%' for x in cpu_percent_cores]

print('All: {}'.format(cpu_percent_total_str))
for i in range(4):
	print('Core'+str(i)+' : '+cpu_percent_cores_str[i])