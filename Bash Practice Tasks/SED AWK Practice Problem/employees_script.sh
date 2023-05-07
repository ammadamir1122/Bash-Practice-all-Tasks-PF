#!/bin/bash

# Replace "Software" with "IT"
sed -i 's/Software/IT/g' employees.txt

# Remove rows where employee age is less than 30
awk -F ',' '$3>=30' employees.txt > temp.txt && mv temp.txt employees.txt

# Calculate average salary of employees in each department
awk -F ',' '{sum[$4] += $5; count[$4] += 1}
END {for (dept in sum) printf("%s: %d\n", dept, int(sum[dept]/count[dept]+0.5))}' employees.txt > updated_employees.txt

# Print output
cat updated_employees.txt

