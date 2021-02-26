package com.example.native_call_demo

import android.app.AlertDialog
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel


class MainActivity : io.flutter.app.FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterView, MainActivity.Companion.CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getData") {
               showAlertDialog()
               // result.success(getData())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun showAlertDialog() {
        val dialogBuilder = AlertDialog.Builder(this)

        // set message of alert dialog
        dialogBuilder.setMessage("Do you want to close this application ?")
                // if the dialog is cancelable
                .setCancelable(false)
                // positive button text and action
                .setPositiveButton("Yes"){dialogInterface, which ->

                }
                // negative button text and action
                .setNegativeButton("Cancel"){dialogInterface, which ->

                }


        // create dialog box
        val alert = dialogBuilder.create()
        // set title for alert dialog box
        alert.setTitle("AlertDialogExample")
        // show alert dialog
        alert.show()
    }

    fun getData(): String{
        return "Message From Android"
    }

    companion object {
        private const val CHANNEL = "MyNativeChannel"
    }
}