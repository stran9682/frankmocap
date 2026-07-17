set CL="/Zc:preprocessor"

echo Installing a third-party 2D keypoint detector
python scripts_py/install_pose2d.py

echo Download extra data for body module
python scripts_py/download_data_body_module.py

echo Installing a third-party hand detector
python scripts_py/install_hand_detectors.py 

rem installing the hand object detector
set DISTUTILS_USE_SDK=1
cd detectors\hand_object_detector\lib
python -m pip install -e . --no-build-isolation
cd ../../..


echo Download extra data for hand module
python scripts_py/download_data_hand_module.py

echo Downloading sample videos
python scripts_py/download_sample_video.py

hf download ragamounibatchu/frankmocap-hand-detector-weights --local-dir extra_data/hand_module/hand_detector/