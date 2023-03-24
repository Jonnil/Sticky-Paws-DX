// Check if the current request ID matches the one we sent
if (async_load[? "id"] == global.http_request_id) {
    // Get the status code and response body
    var status_code = async_load[? "status"];
    var response_str = async_load[? "result"];
<<<<<<< Updated upstream

	// TODO: Figure out why this is happening and fix
=======
    
    // Debugging: Display the status code and response body
    //show_message("Status Code: " + string(status_code));
    //show_message("Response: " + string(response_str));

    // TODO: Figure out why this is happening and fix
>>>>>>> Stashed changes
    // Check if the response status is 200 (OK) or 0
    if (status_code == 200 || status_code == 0) {
        // Get the response as a string and decode it from JSON
        var response_json = json_decode(response_str);
        var file_data_base64 = response_json[? "data"];

        // Save the decoded data to a local file (with the .zip extension)
<<<<<<< Updated upstream
		var buffer = buffer_base64_decode(file_data_base64);
=======
        var buffer = buffer_base64_decode(file_data_base64);
>>>>>>> Stashed changes
        var file_save_location = working_directory + "/custom_levels/" + string(response_json[? "name"]) + ".zip";
        buffer_save(buffer, file_save_location);

        // Free the buffer memory
        buffer_delete(buffer);
<<<<<<< Updated upstream
    } else {
        // If the status is neither 200 nor 0, show an error message
		// TODO: Move this to in-game after fixing current success message.
        var error_message = "Error downloading file. Status: " + string(status_code);
        show_message(error_message);
    }
}
=======
        
        //show_message("File downloaded successfully!");
    }// else {
        // If the status is neither 200 nor 0, show an error message
        //var error_message = "Error downloading file. Status: " + string(status_code);
        //show_message(error_message);
    //}
}
>>>>>>> Stashed changes
