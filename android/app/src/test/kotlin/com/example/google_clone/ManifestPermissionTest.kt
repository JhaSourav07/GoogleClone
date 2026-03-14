package com.example.google_clone

import android.Manifest
import android.content.pm.PackageManager
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

/**
 * Unit tests verifying that the AndroidManifest.xml declares the INTERNET permission
 * required for production network access.
 *
 * The INTERNET permission was added to the main manifest so that release builds can
 * make network requests. Previously, the permission was only present in the debug and
 * profile manifests (used by Flutter tooling for hot reload / debugging).
 */
@RunWith(RobolectricTestRunner::class)
@Config(manifest = "src/main/AndroidManifest.xml", sdk = [34])
class ManifestPermissionTest {

    private val packageManager: PackageManager
        get() = RuntimeEnvironment.getApplication().packageManager

    private val packageName: String
        get() = RuntimeEnvironment.getApplication().packageName

    // -------------------------------------------------------------------------
    // Positive tests – permission must be present
    // -------------------------------------------------------------------------

    /**
     * Verifies that android.permission.INTERNET is declared in the main manifest so
     * that production (release) builds can access the network.
     */
    @Test
    fun internetPermissionIsDeclaredInMainManifest() {
        val result = packageManager.checkPermission(
            Manifest.permission.INTERNET,
            packageName
        )
        assertEquals(
            "android.permission.INTERNET must be declared in the main manifest for release builds",
            PackageManager.PERMISSION_GRANTED,
            result
        )
    }

    /**
     * Verifies the permission using its full canonical string (not the constant alias),
     * guarding against renames or typos in the manifest entry.
     */
    @Test
    fun internetPermissionDeclaredWithCorrectName() {
        val result = packageManager.checkPermission(
            "android.permission.INTERNET",
            packageName
        )
        assertEquals(
            "android.permission.INTERNET must be declared using the exact canonical name",
            PackageManager.PERMISSION_GRANTED,
            result
        )
    }

    /**
     * Confirms that the manifest exposes the INTERNET permission through the list of
     * requested permissions, which is what PackageManager reports to other components.
     */
    @Test
    fun internetPermissionAppearsInRequestedPermissionsList() {
        val packageInfo = packageManager.getPackageInfo(
            packageName,
            PackageManager.GET_PERMISSIONS
        )
        val requestedPermissions = packageInfo.requestedPermissions?.toList() ?: emptyList()

        assert(requestedPermissions.contains(Manifest.permission.INTERNET)) {
            "requestedPermissions should include android.permission.INTERNET but was: $requestedPermissions"
        }
    }

    // -------------------------------------------------------------------------
    // Negative tests – no unexpected (dangerous) permissions
    // -------------------------------------------------------------------------

    /**
     * Regression: ensures that no dangerous permissions beyond those explicitly
     * intended were accidentally added alongside INTERNET.
     */
    @Test
    fun manifestDoesNotDeclareUnexpectedDangerousPermissions() {
        val dangerousPermissionsNotExpected = listOf(
            Manifest.permission.CAMERA,
            Manifest.permission.READ_CONTACTS,
            Manifest.permission.WRITE_CONTACTS,
            Manifest.permission.ACCESS_FINE_LOCATION,
            Manifest.permission.ACCESS_COARSE_LOCATION,
            Manifest.permission.READ_EXTERNAL_STORAGE,
            Manifest.permission.WRITE_EXTERNAL_STORAGE,
            Manifest.permission.RECORD_AUDIO,
            Manifest.permission.CALL_PHONE,
            Manifest.permission.READ_CALL_LOG,
            Manifest.permission.SEND_SMS,
            Manifest.permission.READ_SMS
        )

        for (permission in dangerousPermissionsNotExpected) {
            val result = packageManager.checkPermission(permission, packageName)
            assertEquals(
                "Unexpected dangerous permission found in manifest: $permission",
                PackageManager.PERMISSION_DENIED,
                result
            )
        }
    }

    /**
     * Boundary / regression test: verifies that a clearly unrelated permission
     * (ACCESS_NETWORK_STATE) was not inadvertently added at the same time as INTERNET.
     * This guards against copy-paste errors in the manifest.
     */
    @Test
    fun accessNetworkStatePermissionIsNotDeclared() {
        val result = packageManager.checkPermission(
            Manifest.permission.ACCESS_NETWORK_STATE,
            packageName
        )
        assertEquals(
            "android.permission.ACCESS_NETWORK_STATE should not be present unless explicitly added",
            PackageManager.PERMISSION_DENIED,
            result
        )
    }

    /**
     * Verifies that INTERNET and PERMISSION_DENIED have different constant values –
     * a sanity check ensuring our assertions above are comparing meaningful values
     * and are not vacuously true.
     */
    @Test
    fun permissionGrantedAndDeniedConstantsAreDistinct() {
        assertNotEquals(
            "PackageManager.PERMISSION_GRANTED and PERMISSION_DENIED must be different values",
            PackageManager.PERMISSION_GRANTED,
            PackageManager.PERMISSION_DENIED
        )
    }
}