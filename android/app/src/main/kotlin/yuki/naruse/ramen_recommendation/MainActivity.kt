package yuki.naruse.ramen_recommendation

import android.content.Context
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException

class MainActivity : FlutterActivity() {
    private val CHANNEL = "ramen_recommendation/android_cert"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getAndroidCertHash") {
                val certHash = getAndroidCertHash(this)
                if (certHash != null) {
                    result.success(certHash)
                } else {
                    result.error("UNAVAILABLE", "Certificate hash not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getAndroidCertHash(context: Context): String? {
        return try {
            val pm: PackageManager = context.packageManager
            val packageInfo: PackageInfo =
                pm.getPackageInfo(context.packageName, PackageManager.GET_SIGNING_CERTIFICATES)

            val signatures: Array<out Signature>? =
                if (packageInfo.signingInfo?.hasMultipleSigners() == true) {
                    packageInfo.signingInfo?.apkContentsSigners
                } else {
                    packageInfo.signingInfo?.signingCertificateHistory
                }

            val signature = signatures?.get(0)
            getCertificateFingerprint( signature ?: return null)
        } catch (e: PackageManager.NameNotFoundException) {
            e.printStackTrace()
            null
        }
    }

    private fun getCertificateFingerprint(signature: Signature): String? {
        return try {
            val md: MessageDigest = MessageDigest.getInstance("SHA1") // "SHA-256"も可
            md.update(signature.toByteArray())
            toHex(md.digest())
        } catch (e: NoSuchAlgorithmException) {
            e.printStackTrace()
            null
        }
    }

    private fun toHex(bytes: ByteArray): String {
        val builder = StringBuilder()
        for (b in bytes) {
            builder.append(String.format("%02x", b))
        }
        return builder.toString()
    }
}