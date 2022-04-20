//macro to threshold images with the MaxEntropy alogirthm
//
// 2021.05.13 Chapel Hill, Kasia Kedziora


currentDir = getDir("Choose a Directory");
myDir = currentDir+"\\data_frames";
myDir_save = currentDir+"./segmentation_frames"

fileList = getFileList(myDir);

setBatchMode(true);

for (j=0; j<lengthOf(fileList); j++) {

	if (indexOf(fileList[j], "ch00") > 0){

		//open
		open(myDir+"\\"+fileList[j]);
	
		//threshold
		setAutoThreshold("MaxEntropy dark");
		setOption("BlackBackground", true);
		run("Convert to Mask");
	
		//save
		saveAs("png", myDir_save+"\\"+replace(fileList[j],".tiff","_foci.png"));
		run("Close All");

	}
}
