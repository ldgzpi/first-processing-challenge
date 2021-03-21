String[] openFileAndReadData(String fileName){

  byte[] decodedBytes = loadBytes(fileName); 
  String decodedString = new String(decodedBytes);
  return decodedString.split("\\R", 0);
  
}

void buildTable(Table table, List<String> columnNames, String[] result){
  
List<String> columns = Arrays.asList(result[0].split(",", -1));
for (String columnName : Arrays.asList(result[0].split(",", -1))){
  table.addColumn(columnName.toString());
}

for (int i = 1 ; i < result.length ; i++){
  List<String> data = Arrays.asList(result[i].split(",", -1));
    TableRow newRow = table.addRow();
      
    newRow.setString(columns.get(0), data.get(0));
    newRow.setString(columns.get(1), data.get(1));
    newRow.setString(columns.get(2), data.get(2));
    newRow.setString(columns.get(3), data.get(3));
    newRow.setString(columns.get(4), data.get(4));

}

}
