plugins {
    id("com.android.application")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.mahfazty"
    compileSdk = 37
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.example.mahfazty"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

// flavorDimensions += "default"
//     productFlavors {
//         create("production") {
//             dimension = "default"
//             resValue(
//                 type="string", 
//                 name="app_name", 
//                 value="Mahfazty Production"
//             )
//         }
//         create("development") {
//             dimension = "default"
//             // applicationIdSuffix = ".dev"
//             resValue(
//                 type="string", 
//                 name="app_name", 
//                 value="Mahfazty Development"
//             )
//         }
//     }

flutter {
    source = "../.."
}
