cd jni
ndk-build
echo "start copy"
if [ ! -d "../../app/src/main/jniLibs/armeabi-v7a" ]; then
   mkdir -p ../../app/src/main/jniLibs/armeabi-v7a/
fi

cp ../libs/armeabi-v7a/libnative-lib.so  ../../app/src/main/jniLibs/armeabi-v7a/
echo "end copy"

rm -r ../obj
rm -r ../libs