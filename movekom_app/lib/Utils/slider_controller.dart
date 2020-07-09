double getValueUpdate(value){
  if (value >= 200){
    return 200;
  }else if (value <= 0){
    return 0;
  }
  return value;
}