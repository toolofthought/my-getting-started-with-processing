int i = 1;
int sum = 0;

while (true) {
  sum = sum + i;
  if (sum > 1000) {
    break;
  }
  
  i = i + 1;
}

println("1 + ... + " + i + " = " + sum + " > 1000");