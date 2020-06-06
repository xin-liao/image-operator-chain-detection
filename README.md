This is the code for our paper 'Robust Detection of Image Operator Chain with Two-stream Convolutional Neural Network'

Directories and files included in the implementation:

	'generate_train_data'
	--This folder contains the codes for generating training data with different operation parameters.

	'train_model'
	--This folder contains the codes for training model.

	'generate_test_data'
	--This folder contains the codes for generating testing data with different operation parameters.

	'test_model'
	--This folder contains the codes for testing model.
	
	'preprocessing'
	--This folder contains the codes for preprocessing.  '\caffe\python\**.py'

	In our paper, we select 1,000 color images from UCID database to generate training and validation databases.
	BOSSbase image set consisting of 10,000 color images is used to acquire the testing image database.

On this basis, an example is given in details:
'Upsampling factor s = 1.5, Gaussian blurring variance ν = 1.0'


	'genetate_train_data\rs15br10\ucid_pro_rs15br10.m'--the code for generating 5 classes data for training.

	'genetate_train_data\rs15br10\label_txt.m'--the code for generating training and validation labels.

	'genetate_train_data\rs15br10\img_lmdb.bat'--the code to create lmdb training and validation file. ('rs15br10_train_lmdb', 'rs15br10_val_lmdb')


	'train_model\rs15br10\Net_train_val.prototxt'--the model prototxt of our network in training stage.

	'train_model\rs15br10\Net_solver.prototxt'--the solver prototxt of our network as described in our paper.

	'train_model\rs15br10\deploy.prototxt'--the model prototxt of our network in testing stage.

	'train_model\rs15br10\Net_train_val_log.bat'--run file to train and test model with corresponding solver and model prototxt.

	'train_model\rs15br10\Net_iter_120000.caffemodel'--the trained model.


	'generate_test_data\boss_rs15br10\boss_pro.m'--the code for generating 5 classes data for testing model.


	'test_model_result\rs15br10\img_testing.py'--the code to test model.
	
To run the code, you need change the file path in all files according to your own experiments.

If you have any questions, please send me an email to xinliao@hnu.edu.cn
