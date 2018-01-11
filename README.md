### 一、Android平台`Openmp`配置

有两种方案：

1. cmake 配置   
	#### app/CMakeLists.txt  
	```
	target_link_libraries( # Specifies the target library.
                       native-lib

                       -lgomp

                       # Links the target library to the log library
                       # included in the NDK.
                       ${log-lib} )
	```
	#### app/build.gradle
	```
	android {
    
	    defaultConfig {
   		   ....
         externalNativeBuild {
           cmake {
             		   cppFlags "-fopenmp"
		             cFlags "-fopenmp"
          	  }
       	 }
   		}
    
       externalNativeBuild {
       	 cmake {
   			         path "CMakeLists.txt"
	        }
    	}
	}
	```  
	
	
2. ndk配置  

   如果使用ndk方式生成Shared Library 需要把`app/build.gradle` 中的cmake相关配置注释。在*unix系统中，可以直接运行ndk-build/gen.sh 脚本。
   
   ```
   ...
   LOCAL_LDLIBS += -fopenmp
	LOCAL_CPPFLAGS += -fopenmp
	LOCAL_CFLAGS += -fopenmp
	LOCAL_LDFLAGS += -lgomp
   ...
   ```
   
### 二、C++中Openmp基本使用  
```
JNICALL
Java_com_demon_omp_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {

    std::stringstream str_stream;
	 #pragma omp parallel 
    str_stream << '1'; //根据不同机型的最大线程数N，此句程序会执行N次

    std::string hello = str_stream.str();
    return env->NewStringUTF(hello.c_str());
}


``` 
   