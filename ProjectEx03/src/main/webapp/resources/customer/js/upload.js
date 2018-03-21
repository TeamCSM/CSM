function checkImageType(fileName){
		var pattern = /jpg|gif|png|jpeg/i;
		
		return fileName.match(pattern);
	}

function getFileInfo(fullName) {
	
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if(checkImageType(fullName)){
		imgsrc = "/customer/contact/displayFile?fileName="+fullName;
		fileLink = fullName.substr(14);
		
		var front = fullName.substr(0,12); // 2015/00/00/
		var end = fullName.substr(14);
		
		getLink = "/customer/contact/displayFile?fileName="+front+end;
	}else{
		imgsrc = "/resources/dist/img/file.png";
		fileLink = fullName.substr(12);
		getLink = "/customer/contact/displayFile?fileName="+fullName;
	}
	fileName = fileLink.substr(fileLink.indexOf("_")+1);
	
	return {fileName:fileName, imgsrc:imgsrc, getLink:getLink, fullName:fullName};
}