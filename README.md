# Clocoss Signoff 5 - Use (and monitor) pre-emptible instances

# Requirements

1) Ensure that you have installed git
```sudo apt-get install git```
2) Ensure you are running a Google Cloud Console VM (or have access to cloud services api)

# How to Install

Clone the following repository:

``` git clone https://github.com/up776060/up776060S5```

# How we do things

1) Make sure you are in the correct directory

``` cd up776060S5 ```

2) Type the following command into the terminal, replacing N with the number of workers

``` sh signoff5.sh N ```

The program will automatically finish & delete the Worker VMs upon completion

# VM Monitoring Results - Server created BEFORE vms

First run using 8 Workers (Europe West 1c);
- W1: 57, W2: 36, W3: 32, W4: 29, W5: 21, W6: 14, W7: 11, W8: 7

# VM Monitoring Results - When server was started AFTER creating VMS

First Run using 8 Workers (Europe West 1c):
- Worker5 - 32 jobs, Worker8 - 58 jobs, Worker6 - 55 jobs, Worker7 - 58 jobs

Second Run using 8 Workers (Europe West 1c): 
- Worker7 - 97 jobs, Worker8 - 69 jobs, Worker3 - 36 jobs

Third Run using 8 Workers (Europe West 1d): 
- Worker7 - 117 jobs, Worker8 - 84 jobs

Fourth Run using 10 Workers (Europe West 1d):
- Worker9 - 119 jobs, Worker10 - 82 jobs

Fifth Run using 10 Workers (Europe West 1c): 
- Worker9 - 118 jobs, Worker10 - 83 jobs

Sixth Run using 8 Workers (Europe West 1b): 
- Worker6 - 87 jobs, Worker7 - 59 jobs, Worker8 - 57 jobs

Test Run using 4 Workers (Europe West 1b):
- Worker3 - 119 jobs, Worker4 - 82 jobs

Test Run using 4 Workers (Europe West 1b):
- Worker2 - 77 jobs, Worker3 - 74 jobs, Worker 4 - 51 jobs
