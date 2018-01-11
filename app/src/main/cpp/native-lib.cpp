#include <jni.h>
#include <string>
#include <sstream>

extern "C"
JNIEXPORT jstring

JNICALL
Java_com_demon_omp_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {

    std::stringstream str_stream;
#pragma omp parallel
    str_stream << '1';

    std::string hello = str_stream.str();
    return env->NewStringUTF(hello.c_str());
}
