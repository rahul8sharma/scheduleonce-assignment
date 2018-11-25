function get_file(){
  document.getElementById("uploadFile").click();
}
function upload_file(obj){
  var file = obj.value;
  var fileName = file.split("\\");
  document.getElementById("uplloadFileButton").innerHTML = fileName[fileName.length-1];
  document.uploadFile.submit();
  document.getElementById("uploadFile").value = ""
  event.preventDefault();
}